import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_section_title.dart';
import '../../core/widgets/app_skeleton.dart';
import '../../core/widgets/empty_state_view.dart';
import '../../models/home_menu_item.dart';
import '../../models/todo_item.dart';
import '../../router/app_routes.dart';
import '../../viewmodels/home_view_model.dart';
import '../../viewmodels/view_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoItem> _localTodoItems = [
    TodoItem(title: '学习 Dart 基础'),
    TodoItem(title: '整理 Flutter 页面结构'),
    TodoItem(title: '接入网络请求封装'),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().loadMenus();
    });
  }

  void _openMenu(HomeMenuItem item) {
    Navigator.pushNamed(context, item.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Flutter Demo')),
          body: RefreshIndicator(
            onRefresh: viewModel.loadMenus,
            child: ListView(
              padding: const EdgeInsets.all(16),
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
                      Text(
                        viewModel.status == ViewStatus.error
                            ? (viewModel.errorMessage ?? '加载失败')
                            : viewModel.status == ViewStatus.empty
                                ? '首页暂无功能入口'
                                : '首页已准备好 ${viewModel.menus.length} 个功能入口，适合做样板工程导航。',
                      ),
                      const SizedBox(height: 12),
                      if (viewModel.status == ViewStatus.loading)
                        Column(
                          children: const [
                            AppSkeleton(height: 14, width: double.infinity),
                            SizedBox(height: 8),
                            AppSkeleton(height: 14, width: 180),
                          ],
                        )
                      else
                        ElevatedButton.icon(
                          onPressed: viewModel.loadMenus,
                          icon: const Icon(Icons.refresh),
                          label: const Text('reload首页数据'),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const AppSectionTitle(
                  title: '功能入口',
                  subtitle: '首页聚合列表页、详情页、请求页等真实开发骨架',
                ),
                const SizedBox(height: 12),
                if (viewModel.menus.isEmpty && viewModel.status != ViewStatus.loading)
                  const EmptyStateView(
                    title: '暂无功能入口',
                    subtitle: '请检查 HomeRepository 的菜单配置。',
                  )
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.menus.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.25,
                    ),
                    itemBuilder: (context, index) {
                      final item = viewModel.menus[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => _openMenu(item),
                        child: AppCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.dynamic_feed,
                                size: 32,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(item.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
      },
    );
  }
}
