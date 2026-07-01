import 'package:oneww/core/helpers/app_logger.dart';

import '../core/network/api_service.dart';
import '../models/accompany_category_detail_entity.dart';
import '../models/banner_respose_entity.dart';
import '../models/home_category_item.dart';
import '../models/home_menu_item.dart';
import '../router/app_routes.dart';

class HomeRepository {
  //https://wanandroid.com/article/list/0/json
  //TODO 根据上面的网络链接，可以获取文章的列表内容，json转flutter实体类：lib/models/article_item_entity.dart
  /**
   * 帮我实现如下功能：
   * (1):把列表页的列表信息，换成上面（https://wanandroid.com/article/list/0/json）连接的数据，形成列表展示,展示title和时间
   * (2)：网络请求的时候，可能需要申请网络权限，帮我补全这块内容
   */

  List<HomeMenuItem> get menuItems => const [
    HomeMenuItem(
      title: '文章列表',
      subtitle: 'ListView + 下拉刷新 + 空状态 + 详情跳转',
      icon: 'article',
      routeName: AppRoutes.articleList,
    ),
    HomeMenuItem(
      title: '请求示例',
      subtitle: 'FutureBuilder / 网络 / 重试 / 结果展示',
      icon: 'cloud',
      routeName: AppRoutes.requestDemo,
    ),
    HomeMenuItem(
      title: '待办页面',
      subtitle: '本地 CRUD + 表单交互 + 组件拆分',
      icon: 'task',
      routeName: AppRoutes.todo,
    ),
    HomeMenuItem(
      title: '个人中心',
      subtitle: '基础信息 / 设置 / 业务入口聚合',
      icon: 'profile',
      routeName: AppRoutes.profile,
    ),
    HomeMenuItem(
      title: '登录',
      subtitle: '登录 / 重设密码 / 绑定手机',
      icon: 'login',
      routeName: AppRoutes.login,
    ),
  ];


  HomeRepository({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  ///获取搭子详情
  Future<List<HomeCategoryItem>> getAccompanyDetailInfo(String userId) async {
    final response = await _apiService.getAccompanyDetailInfo(userId);
    //return response.data?.records ?? <HomeCategoryItem>[];
    AppLogger.info('response:'+response.toString());
    return [];
  }


  ///搭子详情接口对接
  Future<AccompanyCategoryDetailEntity> getAccompanyCategoryDetail(String categoryId, String userId) async {
    final response = await _apiService.getAccompanyCategoryDetail(categoryId, userId);
    AppLogger.info('getAccompanyCategoryDetail 成功: code=${response.code}, message=${response.message}', tag: 'wangling');
    return response;
  }


  ///首页的BannerList
  Future<BannerResposeEntity> getBannerList() async {
    final response = await _apiService.getBannerList();
    AppLogger.info('getBannerList 成功: code=${response.code}, message=${response.message}', tag: 'wangling');
    return response;
  }

}
