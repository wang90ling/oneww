import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/base_page.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_skeleton.dart';
import '../../core/widgets/empty_state_view.dart';
import '../../core/widgets/error_state_view.dart';
import '../../viewmodels/request_view_model.dart';
import '../../viewmodels/view_state.dart';

class RequestDemoPage extends BasePage {
  const RequestDemoPage({super.key});

  @override
  String get pageTitle => '请求页';

  @override
  State<RequestDemoPage> createState() => _RequestDemoPageState();
}

class _RequestDemoPageState extends BasePageState<RequestDemoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RequestViewModel>().loadBundles();
    });
  }

  @override
  Widget buildPage(BuildContext context) {
    return Consumer<RequestViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.status == ViewStatus.loading && viewModel.todos.isEmpty && viewModel.users.isEmpty) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSkeleton(height: 18, width: 180),
                    SizedBox(height: 12),
                    AppSkeleton(height: 14),
                    SizedBox(height: 8),
                    AppSkeleton(height: 14),
                  ],
                ),
              ),
              SizedBox(height: 12),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSkeleton(height: 18, width: 160),
                    SizedBox(height: 12),
                    AppSkeleton(height: 14),
                    SizedBox(height: 8),
                    AppSkeleton(height: 14),
                  ],
                ),
              ),
            ],
          );
        }

        if (viewModel.status == ViewStatus.error && viewModel.todos.isEmpty && viewModel.users.isEmpty) {
          return ErrorStateView(
            message: viewModel.errorMessage ?? '请求失败',
            onRetry: viewModel.loadBundles,
          );
        }

        return RefreshIndicator(
          onRefresh: viewModel.loadBundles,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '接口请求示例',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text('适合放 GET / POST / 列表接口 / 详情接口 的统一演示页。'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: viewModel.loadBundles,
                          icon: const Icon(Icons.refresh),
                          label: const Text('重新请求数据'),
                        ),
                        const SizedBox(width: 12),
                        if (viewModel.status == ViewStatus.loading)
                          const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Todo 接口结果'),
                    const SizedBox(height: 8),
                    if (viewModel.todos.isEmpty)
                      const EmptyStateView(
                        title: '暂无 Todo 数据',
                        subtitle: '可以在这里展示空状态、错误状态、分页状态。',
                      )
                    else
                      ...viewModel.todos.map((item) => Text('• ${item.title}')),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('用户接口结果'),
                    const SizedBox(height: 8),
                    if (viewModel.users.isEmpty)
                      const EmptyStateView(
                        title: '暂无用户数据',
                        subtitle: '正式项目中可根据返回状态展示错误/重试。',
                      )
                    else
                      ...viewModel.users.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('• ${item.name} - ${item.title}'),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
