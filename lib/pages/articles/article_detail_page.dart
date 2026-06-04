import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/base_page.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_skeleton.dart';
import '../../core/widgets/empty_state_view.dart';
import '../../core/widgets/error_state_view.dart';
import '../../models/article_item.dart';
import '../../viewmodels/article_detail_view_model.dart';
import '../../viewmodels/view_state.dart';

class ArticleDetailPage extends BasePage {
  const ArticleDetailPage({super.key, required this.articleId});

  final int articleId;

  @override
  String get pageTitle => '详情页';

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends BasePageState<ArticleDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleDetailViewModel>().loadDetail(widget.articleId);
    });
  }

  @override
  Widget buildPage(BuildContext context) {
    return Consumer<ArticleDetailViewModel>(
      builder: (context, viewModel, _) {
        final article = viewModel.article;

        if (viewModel.status == ViewStatus.loading && article == null) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSkeleton(height: 22, width: 240),
                    SizedBox(height: 12),
                    AppSkeleton(height: 14),
                    SizedBox(height: 8),
                    AppSkeleton(height: 14),
                    SizedBox(height: 8),
                    AppSkeleton(height: 14, width: 180),
                  ],
                ),
              ),
            ],
          );
        }

        if (viewModel.status == ViewStatus.error && article == null) {
          return ErrorStateView(
            message: viewModel.errorMessage ?? '详情加载失败',
            onRetry: () => viewModel.loadDetail(widget.articleId),
          );
        }

        if (article == null) {
          return RefreshIndicator(
            onRefresh: () => viewModel.loadDetail(widget.articleId),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: const [
                SizedBox(height: 100),
                EmptyStateView(
                  title: '详情数据为空',
                  subtitle: '请检查 article repository 是否返回数据，或切换 articleId。',
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => viewModel.loadDetail(widget.articleId),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(article.summary),
                    const SizedBox(height: 16),
                    Text(article.content),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.person_outline, size: 18),
                        const SizedBox(width: 6),
                        Text(article.author),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('详情页可继续扩展：'),
                    SizedBox(height: 8),
                    Text('1. 富文本展示'),
                    Text('2. 图片轮播'),
                    Text('3. 评论列表'),
                    Text('4. 底部操作栏'),
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
