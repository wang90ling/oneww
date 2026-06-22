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

/// 热门房间页
class RoomLiveListPage extends StatefulWidget {
  const RoomLiveListPage({super.key});

  @override
  State<RoomLiveListPage> createState() => _RoomLiveListPageState();
}

class _RoomLiveListPageState extends State<RoomLiveListPage> {
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<RoomLiveListViewModel>(
        builder: (context, vm, _) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF4F0FF), Color(0xFFF7F8FC)],
              ),
            ),
            child: RefreshIndicator(
              onRefresh: vm.refresh,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverToBoxAdapter(child: _buildHeader(context)),
                  const SliverToBoxAdapter(child: SizedBox(height: 14)),
                  SliverToBoxAdapter(child: _buildCategoryBar(vm)),
                  const SliverToBoxAdapter(child: SizedBox(height: 14)),
                  if (vm.status == ViewStatus.loading && vm.items.isEmpty)
                    _buildSkeletonSliver()
                  else if (vm.status == ViewStatus.error && vm.items.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: ErrorStateView(
                        message: vm.errorMessage ?? '加载失败',
                        onRetry: vm.loadFirstPage,
                      ),
                    )
                  else if (vm.items.isEmpty)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: EmptyStateView(
                          title: '暂无热门房间',
                          subtitle: '下拉刷新试试',
                        ),
                      )
                    else
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
                        sliver: SliverToBoxAdapter(
                          child: _RoomGrid(
                            items: vm.items,
                            hasMore: vm.hasMore,
                            loadingMore: vm.status == ViewStatus.loadingMore,
                            onLoadMore: vm.loadMore,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '树洞',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '发现正在热聊的房间',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.88),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(Icons.search_rounded, color: Color(0xFF1A1A1A)),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBar(RoomLiveListViewModel vm) {
    final categories = ['热门', '小圈', '点唱', '情感', '交友', '电台'];
    return SizedBox(
      height: 38,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final selected = index == 0;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              gradient: selected
                  ? const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)])
                  : null,
              color: selected ? null : Colors.white.withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFF666666),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: categories.length,
      ),
    );
  }

  Widget _buildSkeletonSliver() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (_, __) => const AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: AppSkeleton(),
                ),
                SizedBox(height: 10),
                AppSkeleton(height: 16, width: 120),
                SizedBox(height: 6),
                AppSkeleton(height: 12, width: 80),
              ],
            ),
          ),
          childCount: 6,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.82,
        ),
      ),
    );
  }

}

class _RoomGrid extends StatefulWidget {
  const _RoomGrid({
    required this.items,
    required this.hasMore,
    required this.loadingMore,
    required this.onLoadMore,
  });

  final List<PlayRoomResponseDataRecords> items;
  final bool hasMore;
  final bool loadingMore;
  final VoidCallback onLoadMore;

  @override
  State<_RoomGrid> createState() => _RoomGridState();
}

class _RoomGridState extends State<_RoomGrid> {
  @override
  Widget build(BuildContext context) {
    final totalCount = widget.items.length + (widget.hasMore ? 1 : 0);
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >= notification.metrics.maxScrollExtent - 180) {
          widget.onLoadMore();
        }
        return false;
      },
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: totalCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.82,
        ),
        itemBuilder: (context, index) {
          if (index >= widget.items.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return _RoomCard(room: widget.items[index]);
        },
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  const _RoomCard({required this.room});

  final PlayRoomResponseDataRecords room;

  @override
  Widget build(BuildContext context) {
    final title = (room.roomName ?? room.moduleName ?? '未命名房间').trim();
    final subtitle = (room.mainLabel ?? '').trim();
    final online = room.onlineCount ?? 0;
    final heat = (room.heatValueStr ?? '').trim();
    final avatar = (room.roomAvatar ?? room.moduleAvatar ?? '').trim();
    final image = avatar.isNotEmpty ? avatar : 'https://images.unsplash.com/photo-1511367461989-f85a21fda167?auto=format&fit=crop&w=900&q=80';

    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 0.82,
              child: Image.network(
                image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFFF1F3F8),
                  child: const Center(
                    child: Icon(Icons.broken_image_outlined, size: 34, color: Color(0xFFB0B7C3)),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.08),
                      Colors.black.withValues(alpha: 0.18),
                      Colors.black.withValues(alpha: 0.72),
                    ],
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              right: 10,
              child: Row(
                children: [
                  _RoomPill(
                    text: subtitle.isNotEmpty ? subtitle : '热门',
                    gradient: const LinearGradient(colors: [Color(0xFFFF7BC1), Color(0xFFFF5B7A)]),
                  ),
                  const Spacer(),
                  if (online > 0)
                    _RoomPill(
                      text: _formatCount(online),
                      gradient: const LinearGradient(colors: [Color(0xFF8E7BFF), Color(0xFF5A7BFF)]),
                    ),
                ],
              ),
            ),
            if (room.openStatus == 1)
              Positioned(
                right: 10,
                top: 44,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.lock_rounded, size: 18, color: Color(0xFF7A5CFF)),
                ),
              ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      height: 1.18,
                    ),
                  ),
                  if (heat.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.local_fire_department_rounded, size: 14, color: Color(0xFFFFD36A)),
                        const SizedBox(width: 3),
                        Text(
                          heat,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: _HostAvatar(url: room.roomAvatar ?? room.moduleAvatar ?? ''),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 10000) {
      final value = count / 10000;
      return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}w';
    }
    return '$count';
  }
}

class _RoomPill extends StatelessWidget {
  const _RoomPill({required this.text, required this.gradient});

  final String text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _HostAvatar extends StatelessWidget {
  const _HostAvatar({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return const SizedBox.shrink();
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: Colors.white24,
            child: const Icon(Icons.person, size: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
