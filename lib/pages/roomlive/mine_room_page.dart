import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/app_skeleton.dart';
import '../../core/widgets/empty_state_view.dart';
import '../../core/widgets/error_state_view.dart';
import '../../models/play_room_response_entity.dart';
import '../../models/user_detail_response_entity.dart';
import '../../repositories/profile_me_repository.dart';
import '../../repositories/room_live_repository.dart';
import '../../viewmodels/room_live_list_view_model.dart';
import '../../viewmodels/view_state.dart';

/// 我的房间页面
class MineRoomPage extends StatefulWidget {
  const MineRoomPage({super.key});

  @override
  State<MineRoomPage> createState() => _MineRoomPageState();
}

class _MineRoomPageState extends State<MineRoomPage> {
  late final RoomLiveListViewModel _viewModel;
  late final Future<UserDetailResponseData?> _userFuture;

  @override
  void initState() {
    super.initState();
    _viewModel = RoomLiveListViewModel(repository: RoomLiveRepository())..loadFirstPage();
    _userFuture = (() async {
      try {
        final value = await ProfileMeRepository().getUserInfo();
        return value.data;
      } catch (_) {
        return null;
      }
    })();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        backgroundColor: const Color(0xFF090A2A),
        body: Stack(
          children: [
            const _RoomBackground(),
            SafeArea(
              child: FutureBuilder<UserDetailResponseData?>(
                future: _userFuture,
                builder: (context, userSnapshot) {
                  final user = userSnapshot.data;
                  return Consumer<RoomLiveListViewModel>(
                    builder: (context, vm, _) {
                      final personalRoom = _buildPersonalRoom(user, vm.items);
                      return RefreshIndicator(
                        color: const Color(0xFFFFD66B),
                        backgroundColor: const Color(0xFF1A1C52),
                        onRefresh: vm.refresh,
                        child: CustomScrollView(
                          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                          slivers: [
                            if (personalRoom != null)
                              SliverToBoxAdapter(child: _buildTopBar(context, personalRoom)),
                            const SliverToBoxAdapter(child: SizedBox(height: 10)),
                            if (vm.status == ViewStatus.loading && vm.items.isEmpty)
                              _buildLoadingStage()
                            else if (vm.status == ViewStatus.error && vm.items.isEmpty)
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: ErrorStateView(
                                  message: vm.errorMessage ?? '房间加载失败',
                                  onRetry: vm.loadFirstPage,
                                ),
                              )
                            else if (vm.items.isEmpty)
                              const SliverFillRemaining(
                                hasScrollBody: false,
                                child: EmptyStateView(
                                  title: '暂无我的房间',
                                  subtitle: '下拉刷新或稍后再试',
                                ),
                              )
                            else if (personalRoom != null) ...[
                              SliverToBoxAdapter(child: _buildStage(personalRoom)),
                              SliverToBoxAdapter(child: SizedBox(height: bottomInset + 98)),
                            ],
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: bottomInset + 10,
              child: const _BottomBar(),
            ),
          ],
        ),
      ),
    );
  }

  PlayRoomResponseDataRecords? _buildPersonalRoom(UserDetailResponseData? user, List<PlayRoomResponseDataRecords> items) {
    if (user == null || items.isEmpty) return null;
    for (final room in items) {
      if (room.roomOwner == user.userId) return room;
    }
    return items.first;
  }

  Widget _buildTopBar(BuildContext context, PlayRoomResponseDataRecords room) {
    final title = _roomTitle(room);
    final roomId = room.roomNo?.toString() ?? room.id?.toString() ?? '10000668';
    final avatar = _roomAvatar(room);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Row(
                children: [
                  _Avatar(url: avatar, size: 42),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'ID: $roomId',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.75),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          const _CircleAction(icon: Icons.group_outlined, badge: '1'),
          const SizedBox(width: 10),
          const _CircleAction(icon: Icons.volume_up_outlined),
        ],
      ),
    );
  }

  SliverPadding _buildLoadingStage() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              height: 560,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(28),
              ),
              padding: const EdgeInsets.all(20),
              child: const Column(
                children: [
                  Align(alignment: Alignment.centerLeft, child: AppSkeleton(height: 30, width: 82)),
                  SizedBox(height: 26),
                  AppSkeleton(width: 72, height: 72, borderRadius: 36),
                  SizedBox(height: 12),
                  AppSkeleton(height: 16, width: 120),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppSkeleton(width: 54, height: 54, borderRadius: 27),
                      AppSkeleton(width: 54, height: 54, borderRadius: 27),
                      AppSkeleton(width: 54, height: 54, borderRadius: 27),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStage(PlayRoomResponseDataRecords room) {
    final title = _roomTitle(room);
    final avatar = _roomAvatar(room);
    final welcome = _cleanText(room.welcomeMsg, fallback: '欢迎 $title 进入房间');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF12154A), Color(0xFF090A2A)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 24,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          children: [
            _HostSeat(title: title, avatar: avatar),
            const SizedBox(height: 22),
            const _SeatRow(),
            const SizedBox(height: 20),
            const _SeatRow(bottom: true),
            const SizedBox(height: 26),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '点Ta提醒您：聊天内容低俗、色情、政治等都会被屏蔽处理，良好的发言环境需要大家共同营造！',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.82),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  welcome,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _roomTitle(PlayRoomResponseDataRecords? room) {
    return _cleanText(room?.roomName, fallback: _cleanText(room?.moduleName, fallback: '我的房间'));
  }

  String _roomAvatar(PlayRoomResponseDataRecords? room) {
    final roomAvatar = (room?.roomAvatar ?? '').trim();
    if (roomAvatar.startsWith('http')) return roomAvatar;
    final moduleAvatar = (room?.moduleAvatar ?? '').trim();
    if (moduleAvatar.startsWith('http')) return moduleAvatar;
    final userAvatar = (room?.userAvatar ?? '').trim();
    if (userAvatar.startsWith('http')) return userAvatar;
    return '';
  }

  String _cleanText(String? text, {required String fallback}) {
    final value = (text ?? '').trim();
    return value.isEmpty ? fallback : value;
  }

}

class _RoomBackground extends StatelessWidget {
  const _RoomBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/ic_doroom_bg.webp',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.78),
                radius: 1.15,
                colors: [Color(0x80252A73), Color(0xFF090A2A)],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.10,
            child: Image.asset(
              'assets/images/ic_hall_room_mask.webp',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
        ),
        Positioned(
          top: 88,
          left: 18,
          child: Image.asset(
            'assets/images/ic_doroom_stage.webp',
            width: 88,
            height: 88,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
        ),
        Positioned(
          top: 240,
          right: 12,
          child: Image.asset(
            'assets/images/ic_doroom_stage_post_info.webp',
            width: 92,
            height: 92,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}

class _CircleAction extends StatelessWidget {
  const _CircleAction({required this.icon, this.badge});

  final IconData icon;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Center(child: Icon(icon, color: Colors.white, size: 22)),
          if (badge != null)
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD66B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(color: Color(0xFF24224F), fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HostSeat extends StatelessWidget {
  const _HostSeat({required this.title, required this.avatar});

  final String title;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 74,
              height: 74,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD66B).withValues(alpha: 0.32),
                    blurRadius: 24,
                    spreadRadius: 4,
                  ),
                  BoxShadow(
                    color: const Color(0xFFB46CFF).withValues(alpha: 0.22),
                    blurRadius: 30,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(
                    width: 74,
                    height: 74,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [Color(0xFFFFD66B), Color(0x00FFD66B)],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                  ),
                  _Avatar(url: avatar, size: 64),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF62B6),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.18),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Text(
                        '房主',
                        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -2,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFFFD66B).withValues(alpha: 0.16), width: 1.5),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _SeatRow extends StatelessWidget {
  const _SeatRow({this.bottom = false});

  final bool bottom;

  @override
  Widget build(BuildContext context) {
    final seats = bottom ? 2 : 3;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(seats, (_) => const _SeatItem()),
    );
  }
}

class _SeatItem extends StatelessWidget {
  const _SeatItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B6BFF).withValues(alpha: 0.26),
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.05),
              border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
            ),
          ),
          const SizedBox(
            width: 58,
            height: 58,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0xFF5140B7), Color(0xFF262154)],
                  stops: [0.15, 1.0],
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/images/ic_doroom_mic.webp',
            width: 22,
            height: 22,
            errorBuilder: (_, __, ___) => const Icon(Icons.mic_none_rounded, color: Color(0xFFB497FF), size: 28),
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: _BottomTextButton(text: '聊聊...')),
        const SizedBox(width: 10),
        _BottomAssetButton(assetPath: 'assets/images/ic_game_voice.webp'),
        const SizedBox(width: 10),
        _BottomAssetButton(assetPath: 'assets/images/ic_doroom_mic_close.webp'),
        const SizedBox(width: 10),
        _BottomAssetButton(assetPath: 'assets/images/ic_doroom_more.webp'),
        const SizedBox(width: 10),
        _BottomAssetButton(assetPath: 'assets/images/email_icon.png'),
        const SizedBox(width: 10),
        _BottomAssetButton(assetPath: 'assets/images/ic_doroom_gift.webp'),
        const SizedBox(width: 10),
        const Expanded(child: _BottomTextButton(text: '下麦')),
      ],
    );
  }
}

class _BottomTextButton extends StatelessWidget {
  const _BottomTextButton({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _BottomAssetButton extends StatelessWidget {
  const _BottomAssetButton({required this.assetPath});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        assetPath,
        width: 22,
        height: 22,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const Icon(Icons.circle, color: Colors.white54, size: 18),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.url, required this.size});

  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipOval(
        child: url.startsWith('http')
            ? Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _fallback(),
              )
            : _fallback(),
      ),
    );
  }

  Widget _fallback() {
    return Container(
      color: Colors.white.withValues(alpha: 0.18),
      child: Icon(Icons.person_rounded, color: Colors.white.withValues(alpha: 0.9), size: size * 0.54),
    );
  }
}
