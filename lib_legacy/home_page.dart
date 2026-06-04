import 'package:flutter/material.dart';
import 'package:oneww/models/todo_item.dart';

import 'components/app_card.dart';
import 'components/app_section_title.dart';
import 'network/api_service.dart';
import 'utils/app_logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  final List<TodoItem> _localTodoItems = [
    TodoItem(title: '学习 Dart 基础'),
    TodoItem(title: '整理 Flutter 页面结构'),
    TodoItem(title: '接入网络请求封装'),
  ];

  bool _loading = false;
  String _statusText = '欢迎使用 Flutter wangling Demo';

  @override
  void initState() {
    super.initState();
    _loadRemoteData();
  }

  Future<void> _loadRemoteData() async {
    setState(() {
      _loading = true;
    });

    try {
      final users = await _apiService.fetchUsers();
      if (!mounted) return;
      setState(() {
        _statusText = users.isNotEmpty
            ? '已加载 ${users.length} 条用户数据，适合做首页、列表页、详情页等业务页面。'
            : '接口已请求完成，但没有拿到可展示的数据。';
      });
    } catch (error, stackTrace) {
      AppLogger.error(
        'Load remote data failed',
        error: error,
        stackTrace: stackTrace,
        tag: 'HomePage',
      );
      if (!mounted) return;
      setState(() {
        _statusText = '网络请求失败，当前页面展示本地示例数据。';
      });
    } finally {
      if (!mounted) return;
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter wangling Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSectionTitle(
                    title: '项目首页',
                    subtitle: '组件包 + 网络请求包 + 页面包 + 工具类',
                  ),
                  const SizedBox(height: 12),
                  Text(_statusText),
                  const SizedBox(height: 12),
                  if (_loading)
                    const LinearProgressIndicator()
                  else
                    ElevatedButton.icon(
                      onPressed: _loadRemoteData,
                      icon: const Icon(Icons.refresh),
                      label: const Text('重新加载网络数据'),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const AppSectionTitle(
              title: '本地待办示例',
              subtitle: '用于演示页面包和组件包的配合方式',
            ),
            const SizedBox(height: 12),
            ..._localTodoItems.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppCard(
                  child: Row(
                    children: [
                      Checkbox(
                        value: item.done,
                        onChanged: (value) {
                          setState(() {
                            item.done = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          item.title,
                          style: TextStyle(
                            decoration: item.done
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
