import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/base_page.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_skeleton.dart';
import '../../core/widgets/empty_state_view.dart';
import '../../core/widgets/error_state_view.dart';
import '../../models/play_room_response_entity.dart';
import '../../repositories/room_live_repository.dart';
import '../../viewmodels/room_live_list_view_model.dart';
import '../../viewmodels/view_state.dart';

class RoomLiveListPage extends BasePage {
  const RoomLiveListPage({super.key});

  @override
  String get pageTitle => '热门房间';

  @override
  State<RoomLiveListPage> createState() => _RoomLiveListPageState();
}

class _RoomLiveListPageState extends BasePageState<RoomLiveListPage> {
  late final RoomLiveListViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RoomLiveListViewModel(repository: RoomLiveRepository())..loadFirstPage();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<RoomLiveListViewModel>(
        builder: (context, vm, _) {
          if (vm.status == ViewStatus.loading && vm.items.isEmpty) {
            return _buildSkeleton();
          }

          if (vm.status == ViewStatus.error && vm.items.isEmpty) {
            return ErrorStateView(
              message: vm.errorMessage ?? '加载失败',
              onRetry: vm.loadFirstPage,
            );
          }

          if (vm.items.isEmpty) {
            return RefreshIndicator(
              onRefresh: vm.refresh,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 80),
                  EmptyStateView(
                    title: '暂无热门房间',
                    subtitle: '下拉刷新试试',
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: vm.refresh,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels >= notification.metrics.maxScrollExtent - 150) {
                  vm.loadMore();
                }
                return false;
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: vm.items.length + (vm.hasMore ? 1 : 0),
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index >= vm.items.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return _RoomCard(room: vm.items[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSkeleton() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, __) => const AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSkeleton(height: 18, width: 200),
            SizedBox(height: 10),
            AppSkeleton(height: 14, width: 140),
            SizedBox(height: 6),
            AppSkeleton(height: 14, width: 100),
          ],
        ),
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  const _RoomCard({required this.room});

  final PlayRoomResponseDataRecords room;

  @override
  Widget build(BuildContext context) {
    final name = (room.roomName ?? room.moduleName ?? '未命名房间').trim();
    final label = (room.mainLabel ?? '').trim();
    final online = room.onlineCount ?? 0;

    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((room.roomAvatar ?? '').isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                room.roomAvatar!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _avatarFallback(60),
              ),
            )
          else
            _avatarFallback(60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (label.isNotEmpty) _Tag(label),
                    if (label.isNotEmpty && online > 0) const SizedBox(width: 8),
                    if (online > 0)
                      Row(
                        children: [
                          Icon(Icons.person, size: 13, color: Colors.grey.shade500),
                          const SizedBox(width: 2),
                          Text('$online 在线', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                        ],
                      ),
                  ],
                ),
                if ((room.heatValueStr ?? '').isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.local_fire_department, size: 13, color: Colors.orange.shade400),
                      const SizedBox(width: 2),
                      Text(room.heatValueStr!, style: TextStyle(fontSize: 12, color: Colors.orange.shade400)),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (room.openStatus == 1)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Text('直播中', style: TextStyle(fontSize: 11, color: Colors.red.shade600, fontWeight: FontWeight.w600)),
            ),
        ],
      ),
    );
  }

  Widget _avatarFallback(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: const Color(0xFFF0EEFF), borderRadius: BorderRadius.circular(10)),
      child: const Icon(Icons.music_note, color: Color(0xFF7A5CFF), size: 28),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: const Color(0xFFF0EEFF), borderRadius: BorderRadius.circular(6)),
      child: Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF7A5CFF), fontWeight: FontWeight.w500)),
    );
  }
}
