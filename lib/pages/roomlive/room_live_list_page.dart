import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/base_page.dart';
import '../../core/helpers/app_logger.dart';
import '../../core/network/api_service.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_skeleton.dart';
import '../../core/widgets/empty_state_view.dart';
import '../../core/widgets/error_state_view.dart';
import '../../models/article_item.dart';
import '../../models/play_room_response_entity.dart';
import '../../models/playroom_by_hot_request.dart';
import '../../router/app_routes.dart';
import '../../viewmodels/article_list_view_model.dart';
import '../../viewmodels/view_state.dart';

///房间直播主入口页面
class RoomLiveListPage extends BasePage {
  const RoomLiveListPage({super.key});

  @override
  String get pageTitle => '文章列表';

  @override
  State<RoomLiveListPage> createState() => _RoomLiveListPageState();
}

class _RoomLiveListPageState extends BasePageState<RoomLiveListPage> {

  final ApiService _apiService = ApiService();

  bool _isLoadingRoomLiveList = true;
  String? _roomLiveListError;
  List<PlayRoomResponseDataRecords>? _playRoomResponseRecords = <PlayRoomResponseDataRecords>[];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleListViewModel>().loadFirstPage();
    });

    _getRoomHotLiveList();
  }

  void _openDetail(ArticleItem item) {
    if (item.content.isNotEmpty && Uri.tryParse(item.content) != null) {
      Navigator.pushNamed(
        context,
        AppRoutes.webView,
        arguments: {
          'url': item.content,
          'title': item.title,
        },
      );
    } else {
      Navigator.pushNamed(
        context,
        AppRoutes.articleDetail,
        arguments: item.id,
      );
    }
  }

  ///加载最热门直播房间
  Future<void> _getRoomHotLiveList() async {
    setState(() {
      _isLoadingRoomLiveList = true;
      _roomLiveListError = null;
    });

    try {
      final response = await _apiService.getPlayRoomByHot(
        PlayroomByHotRequest(
          pageNo: 1,
          pageSize: 20,
        ),
      );

      AppLogger.info('newPostResponse: ${response.data?.records?.length}', tag: 'RoomLiveListPage');
      if (!mounted) return;
      setState(() {
        _playRoomResponseRecords = response.data?.records;
      });
    } catch (error) {
      AppLogger.error('加载最热直播房间失败', error: error, tag: 'RoomLiveListPage');
      if (!mounted) return;
      setState(() => _roomLiveListError = '加载最热直播房间失败');
    } finally {
      if (!mounted) return;
      setState(() => _isLoadingRoomLiveList = false);
    }
  }

  @override
  Widget buildPage(BuildContext context) {
    return Consumer<ArticleListViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.status == ViewStatus.loading && viewModel.items.isEmpty) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: 5,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, __) => const AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSkeleton(height: 18, width: 220),
                  SizedBox(height: 12),
                  AppSkeleton(height: 14),
                  SizedBox(height: 8),
                  AppSkeleton(height: 14, width: 180),
                ],
              ),
            ),
          );
        }

        if (viewModel.status == ViewStatus.error && viewModel.items.isEmpty) {
          return ErrorStateView(
            message: viewModel.errorMessage ?? '未知错误',
            onRetry: viewModel.loadFirstPage,
          );
        }

        if (viewModel.items.isEmpty) {
          return RefreshIndicator(
            onRefresh: viewModel.refresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: const [
                SizedBox(height: 80),
                EmptyStateView(
                  title: '暂无文章数据',
                  subtitle: '这里适合接接口分页、搜索筛选、下拉刷新和上拉加载更多。',
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: viewModel.refresh,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels >= notification.metrics.maxScrollExtent - 120) {
                viewModel.loadMore();
              }
              return false;
            },
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: viewModel.items.length + (viewModel.hasMore ? 1 : 0),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index >= viewModel.items.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final item = viewModel.items[index];
                return InkWell(
                  onTap: () => _openDetail(item),
                  child: AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (item.date != null)
                              Text(
                                item.date!,
                                style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                              ),
                            if (item.date != null && item.author.isNotEmpty)
                              const SizedBox(width: 12),
                            if (item.author.isNotEmpty)
                              Text(
                                item.author,
                                style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
