# 腾讯云 COS 图片与视频上传功能设计与实现总结

## 1. 文档目的

本文用于总结当前项目中“圈子发布”功能的媒体上传链路，重点说明 Flutter 端、Platform Channel 通信层、原生 Android 端以及腾讯云 COS SDK 之间的协作方式，便于后续维护、排障与扩展。

本文覆盖的能力包括：

- 圈子发布前的媒体选择与预处理
- 上传前置凭证获取
- Flutter 与 Android 之间的通道通信
- 原生 Android 端直传腾讯云 COS
- 上传结果回传与圈子发帖提交

---

## 2. 总体架构

当前实现采用“Flutter 编排 + 原生 Android 上传 + 腾讯云 COS 存储”的分层方案：

- **Flutter 负责页面交互、发布流程编排、状态管理**
- **后端接口负责返回 COS 临时凭证与相关配置**
- **Android 原生层负责调用腾讯云 COS SDK 完成文件上传**
- **Flutter 在获得 URL 后调用圈子发帖接口完成最终发布**

这种设计将大文件传输和 UI 逻辑解耦，提升了可维护性和上传稳定性。

---

## 3. 圈子发布完整流程

### 3.1 用户侧操作

用户在圈子页面点击发布后，可执行以下操作：

1. 输入动态文案
2. 选择图片或视频文件
3. 选择话题标签与可见性
4. 提交发布请求

### 3.2 Flutter 发布流程

发布按钮触发后，`CirclePage` 会执行如下流程：

1. 打开发布面板
2. 收集文本、图片、视频、话题和可见性信息
3. 调用 `formDataUpload()` 获取上传凭证
4. 将凭证映射为 `CosUploadConfig`
5. 对每个媒体文件执行上传
6. 收集上传成功后的资源 URL
7. 调用 `createCirclePost()` 提交发帖
8. 发布成功后刷新圈子列表

### 3.3 原生上传流程

当 Flutter 调用上传通道后，Android 原生层执行：

1. 接收上传参数
2. 校验文件路径和 COS 配置
3. 构建腾讯云 COS 客户端
4. 生成对象 Key
5. 执行 COS 直传
6. 返回最终访问 URL

---

## 4. 上传前置凭证与配置流转

### 4.1 前置凭证获取

在上传真实媒体之前，Flutter 会先调用后端接口获取临时凭证，入口为：

- `CircleRepository.formDataUpload()`

后端返回内容用于构建上传所需参数，通常包括：

- `secretId`
- `secretKey`
- `sessionToken`
- `region`
- `bucket`

### 4.2 配置封装

后端返回后，会被封装为：

- `CosUploadConfig`

该对象是 Flutter 与 Android 上传链路之间的核心配置载体，确保原生层拿到完整的 COS 凭证与目标存储信息。

---

## 5. Flutter 通过 Platform Channel 调用 Android 原生功能：技能点拆解与 Demo 分析

这一节专门解释一个最关键的技能点：**Flutter 如何通过 Platform Channel 调用 Android 原生能力**。结合当前项目，这里实际上完成了三件事：

1. Flutter 把“选择文件、请求上传、提交发帖”的业务编排起来
2. Flutter 通过 Platform Channel 把“上传文件”的动作交给 Android 原生层
3. Android 原生层借助腾讯 COS SDK 完成真正的文件直传

为了更容易理解，可以先把它当成一个最小 Demo 来看。

### 5.1 一个最小 Demo：Flutter 调 Android 原生方法

假设我们只想让 Flutter 端调用 Android 端的一个方法 `uploadFile`，并拿到返回值，那么最简化的流程如下：

#### Flutter 侧

Flutter 端创建一个 `MethodChannel`，通道名通常是双方约定好的字符串，例如：

```dart
const MethodChannel('tencent_cos_upload')
```

然后通过 `invokeMethod` 发起调用：

```dart
final result = await const MethodChannel('tencent_cos_upload').invokeMethod<String>(
  'uploadFile',
  {
    'path': '/tmp/demo.jpg',
    'fileName': 'demo.jpg',
  },
);
```

这里的核心点是：

- `tencent_cos_upload` 是“通道名”
- `uploadFile` 是“方法名”
- Map 是“入参”
- `result` 是“原生返回值”

#### Android 侧

Android 端在 `MainActivity` 中监听同一个通道名：

```kotlin
MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "tencent_cos_upload")
    .setMethodCallHandler { call, result ->
        when (call.method) {
            "uploadFile" -> {
                result.success("ok")
            }
            else -> result.notImplemented()
        }
    }
```

这段逻辑表达的含义是：

- 当 Flutter 调用 `uploadFile` 时，Android 进入对应分支
- Android 执行原生逻辑后，通过 `result.success()` 把结果返回给 Flutter
- 如果方法名不认识，就返回 `notImplemented()`

#### 这就是 Platform Channel 的本质

**Flutter 发消息给原生，原生处理完再把结果回传 Flutter。**

它并不是 HTTP 请求，也不是数据库调用，而是一个跨语言、跨运行时的“消息桥”。

---

### 5.2 当前项目中的 Platform Channel 设计

当前项目并不是只传一个字符串，而是把“腾讯 COS 上传”所需的完整参数都通过通道传给 Android。

#### Flutter 侧定义

当前 Flutter 侧使用的上传通道为：

- `tencent_cos_upload`

进度通道为：

- `tencent_cos_upload_progress`

#### Flutter 调用协议

Flutter 调用原生的统一方法名为：

- `uploadFile`

传递参数包括：

- `path`
- `fileName`
- `secretId`
- `secretKey`
- `sessionToken`
- `region`
- `bucket`
- `objectKey`（可选，用于显式指定对象路径）

#### 为什么要把这些参数都传给原生

因为真正执行上传的是 Android 原生层，而 COS SDK 需要这些信息完成鉴权和目标定位：

- `path`：本地文件路径
- `fileName`：文件名，用于生成对象 Key
- `secretId` / `secretKey` / `sessionToken`：临时凭证
- `region`：COS 区域
- `bucket`：目标桶
- `objectKey`：对象存储路径

Flutter 自己不直接上传，而是把“上传能力”委托给原生层。

---

### 5.3 Demo 分析：一次完整调用发生了什么

结合当前项目，可以把一次上传请求拆成 6 个阶段。

#### 第 1 阶段：用户在 Flutter 页面选择文件

在 `CirclePage` 中，用户通过发布面板选择图片或视频后，页面会拿到一个 `XFile` 列表。

此时 Flutter 还没有上传，只有本地文件。

#### 第 2 阶段：Flutter 请求上传凭证

Flutter 先调用 `formDataUpload()`，拿到后端返回的 COS 临时凭证。

这一步的目的不是上传文件，而是提前获取后续上传所需的“钥匙”。

#### 第 3 阶段：Flutter 组装 Platform Channel 参数

Flutter 将上传参数整理成 Map，然后通过 `TencentCosUploadService` 发起 `invokeMethod`。

此时 Flutter 只负责“发起请求”，不关心原生内部怎么上传。

#### 第 4 阶段：Android 接收消息并校验参数

Android 在 `MainActivity.configureFlutterEngine()` 中收到请求后，会先检查参数是否完整。

这是很重要的一步，因为原生层直接面对文件系统和 SDK 调用，参数不完整时最好立即失败，而不是进入更深层逻辑。

#### 第 5 阶段：Android 执行腾讯 COS 上传

参数校验通过后，Android 会：

1. 构建 `CosUploadConfig`
2. 实例化 `CosUploader`
3. 开启后台线程
4. 调用腾讯 COS SDK 的上传接口
5. 上传成功后拼接对象 URL

#### 第 6 阶段：原生返回 URL，Flutter 再提交圈子发布

Android 上传完成后，通过 `result.success(url)` 把资源 URL 返回给 Flutter。

Flutter 拿到 URL 后，把它放到 `mediaUrls`，再调用 `createCirclePost()` 发帖接口，完成整个发布流程。

---

### 5.4 Flutter 侧职责：为什么要封装成 Service / Repository

当前项目里，Flutter 并不是在页面里直接写通道调用，而是把通道调用封装到了 `TencentCosUploadService` 和 Repository / ViewModel 中。

这样做的好处是：

- 页面代码更干净
- 发布逻辑更容易复用
- 后续如果通道名变化，只需要改一处
- 原生调用细节不会散落在 UI 层

所以在架构上可以理解为：

- `CirclePage` 负责交互
- `CircleViewModel` 负责业务状态
- `CircleRepository` 负责数据与上传编排
- `TencentCosUploadService` 负责与原生通道通信

---

### 5.5 Android 侧职责：为什么必须放在原生层

Android 侧在 `MainActivity.configureFlutterEngine()` 中注册通道处理器，负责：

- 注册 `MethodChannel`
- 注册 `EventChannel`
- 校验参数
- 构建 COS 上传对象
- 启动后台线程执行上传
- 回传结果与进度

之所以需要放在 Android 原生层，原因主要有：

- COS SDK 是 Java / Kotlin 生态的原生能力
- 大文件上传更适合原生层控制线程、IO 与回调
- 临时凭证、网络重试、进度回调等能力在原生层更稳定

---

### 5.6 Flutter 调 Android 的流程图

下面这张流程图可以帮助理解当前项目中 Flutter、Platform Channel、原生 Android 和腾讯 COS SDK 的协作关系：

```mermaid
flowchart LR
    A[用户在 Flutter 页面选择图片/视频] --> B[CirclePage 打开发布面板]
    B --> C[CircleViewModel / CircleRepository 组织发布流程]
    C --> D[调用 formDataUpload 获取 COS 临时凭证]
    D --> E[封装 CosUploadConfig]
    E --> F[TencentCosUploadService.invokeMethod]
    F --> G[MethodChannel: tencent_cos_upload]
    G --> H[MainActivity 接收 uploadFile 请求]
    H --> I[参数校验 + 构建 CosUploadConfig]
    I --> J[CosUploader 调用腾讯 COS SDK 上传]
    J --> K[返回上传成功 URL]
    K --> L[Flutter 汇总 mediaUrls]
    L --> M[调用 createCirclePost 提交圈子内容]
    M --> N[发布成功并刷新列表]
```

### 5.7 MethodChannel 与 EventChannel 的区别

当前项目里同时用了两种通道：

#### MethodChannel

用于“一次请求 -> 一次返回”的场景。

例如：

- Flutter 调用 `uploadFile`
- Android 上传完成后返回 URL

#### EventChannel

用于“持续推送事件流”的场景。

例如：

- Android 持续向 Flutter 推送上传进度
- Flutter 订阅这个流并更新进度条

可以简单理解为：

- `MethodChannel` 适合“做一件事，然后回结果”
- `EventChannel` 适合“持续告诉我当前状态”

---

### 5.7 Demo 级别的调用时序图

可以把当前链路理解成下面这个时序：

```text
Flutter Page
  -> ViewModel
  -> Repository
  -> TencentCosUploadService
  -> MethodChannel
  -> MainActivity
  -> CosUploader
  -> Tencent COS SDK
  -> MethodChannel result.success(url)
  -> Flutter Repository / ViewModel
  -> createCirclePost()
```

如果换成更口语化的说法：

1. Flutter 先把文件选出来
2. Flutter 通过通道告诉 Android“请帮我上传这个文件”
3. Android 用 COS SDK 真正上传
4. Android 把结果返回 Flutter
5. Flutter 再拿 URL 去发圈子内容

---

### 5.8 这个技能点的本质总结

Flutter 通过 Platform Channel 调原生，核心不是“调用接口”，而是“建立一条跨语言消息通道”。

在当前项目里，这个能力的价值体现在：

- Flutter 保持业务编排和 UI 交互能力
- Android 保持文件上传和 COS SDK 能力
- 两者通过统一协议完成媒体上传闭环

---

## 6. 原生 Android 上传实现

### 6.1 依赖引入

Android 模块已引入腾讯云 COS SDK：

```kotlin
implementation("com.qcloud.cos:cos-android:5.9.35")
```

该依赖提供了上传所需的核心能力，包括：

- `COSClient`
- `ClientConfig`
- `BasicSessionCredentialProvider`
- `PutObjectRequest`
- `Region`

### 6.2 上传配置模型

原生侧使用以下配置对象承接 Flutter 传入的凭证信息：

```kotlin
data class CosUploadConfig(
    val secretId: String,
    val secretKey: String,
    val sessionToken: String,
    val region: String,
    val bucket: String,
)
```

### 6.3 上传执行逻辑

`CosUploader` 的主要工作包括：

- 检查本地文件是否存在
- 根据原始文件名生成对象 Key
- 初始化 COS 认证与客户端配置
- 调用 `putObject` 执行上传
- 根据 bucket、region 与 objectKey 拼接最终 URL

### 6.4 对象 Key 组织方式

对象 Key 采用按类型分目录的方式组织：

- 图片：`circle/images/`
- 视频：`circle/videos/`

最终 Key 形如：

```text
circle/images/时间戳/原始文件名
circle/videos/时间戳/原始文件名
```

该策略的作用是：

- 降低文件名冲突风险
- 便于后续对象管理与排查
- 使资源目录结构更清晰

### 6.5 资源 URL 生成

上传完成后，原生层按腾讯 COS 标准地址格式拼接访问链接：

```text
https://{bucket}.cos.{region}.myqcloud.com/{objectKey}
```

该 URL 将回传至 Flutter，用于后续发帖接口的 `mediaUrls` 参数。

---

## 7. Flutter 侧业务分层

### 7.1 `CirclePage`

`CirclePage` 负责 UI 与用户交互，主要职责：

- 触发发布面板
- 展示圈子内容列表
- 维护上传中的交互状态
- 监听上传结果并提示用户

### 7.2 `CircleViewModel`

`CircleViewModel` 负责业务状态管理，主要职责：

- 拉取圈子列表
- 管理发布状态
- 保存上传凭证结果
- 发起媒体上传
- 调用圈子发帖接口
- 处理错误状态与刷新逻辑

### 7.3 `CircleRepository`

`CircleRepository` 负责数据访问与上传桥接，主要职责：

- 调用后端圈子接口
- 获取 COS 上传前置凭证
- 将后端数据转换为 `CosUploadConfig`
- 调用 Flutter -> Android 上传通道
- 提交圈子发布内容

---

## 8. 数据流转路径

### 8.1 后端到 Flutter

后端返回的 COS 凭证信息被 Flutter 接收并映射为 `CosUploadConfig`。

### 8.2 Flutter 到 Android

Flutter 通过 `MethodChannel` 将媒体路径和 COS 配置传给 Android。

### 8.3 Android 到 COS

Android 通过腾讯 COS SDK 直传图片或视频文件。

### 8.4 Android 到 Flutter

上传完成后，Android 将最终 URL 返回给 Flutter。

### 8.5 Flutter 到圈子接口

Flutter 汇总 URL 后提交圈子发布请求，完成最终发布。

---

## 9. 当前实现状态与规范化说明

### 9.1 命名统一情况

当前主上传通道已统一为腾讯 COS 命名：

- `tencent_cos_upload`
- `tencent_cos_upload_progress`

Android 端相关类也已改为 COS 命名：

- `CosUploadConfig`
- `CosUploader`

### 9.2 历史遗留处理

项目中已清理主要阿里云相关命名与依赖引用，避免后续维护时出现“功能已经迁移、名称仍然旧”的混淆问题。

### 9.3 可进一步增强的点

后续仍可继续优化以下能力：

- 真正的 COS 原生上传进度回调
- 更统一的错误码与异常信息
- 对大视频上传的分片上传支持
- 更严格的对象 Key 规则与后端目录约定

---

## 10. 结论

当前项目的圈子发布上传链路已经形成闭环：

1. Flutter 获取页面输入与媒体文件
2. Flutter 请求后端获取 COS 临时凭证
3. Flutter 通过 Platform Channel 调用 Android 原生上传
4. Android 使用腾讯云 COS SDK 完成图片/视频直传
5. 原生返回文件 URL 给 Flutter
6. Flutter 调用圈子发布接口完成最终提交

该方案具备如下优势：

- 前后端职责清晰
- 上传能力下沉到原生层，性能稳定
- Flutter 侧只负责业务编排，逻辑清楚
- COS 对象 URL 可直接复用于后续发布接口


