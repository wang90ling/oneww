import 'package:flutter/material.dart';

/**
 * @author wangling
 * @date 2026/6/25 14:51
 * @description 派单厅功能实现
 */
class DispatchingCenterListPage extends StatefulWidget {
  const DispatchingCenterListPage({super.key});

  @override
  State<DispatchingCenterListPage> createState() =>
      _DispatchingCenterListPageState();
}

class _DispatchingCenterListPageState extends State<DispatchingCenterListPage> {
  final List<_DispatchRoomItem> _rooms = const [
    _DispatchRoomItem(
      rank: 1,
      title: 'test111',
      coverUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=900&q=80',
      hostName: '暂无主持~',
      heat: '1100',
      tag: '派单',
      top: true,
    ),
    _DispatchRoomItem(
      rank: 2,
      title: '测试派单房',
      coverUrl:
          'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?auto=format&fit=crop&w=900&q=80',
      hostName: '暂无主持~',
      heat: '1100',
      tag: '派单',
      top: true,
    ),
    _DispatchRoomItem(
      rank: 3,
      title: '石伟伟',
      coverUrl:
          'https://images.unsplash.com/photo-1517423440428-a5a00ad493e8?auto=format&fit=crop&w=900&q=80',
      hostName: '暂无主持~',
      heat: '1100',
      tag: '派单',
      top: true,
    ),
    _DispatchRoomItem(
      title: '暂留test',
      coverUrl:
          'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?auto=format&fit=crop&w=900&q=80',
      hostName: '暂无主持~',
      heat: '1100',
      tag: '派单',
    ),
    _DispatchRoomItem(
      title: '8468',
      coverUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=900&q=80',
      hostName: '暂无主持~',
      heat: '1100',
      tag: '派单',
    ),
    _DispatchRoomItem(
      title: '小浣熊派单厅',
      coverUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=900&q=80',
      hostName: '暂无主持~',
      heat: '1100',
      tag: '派单',
    ),
    _DispatchRoomItem(
      title: '派单厅',
      coverUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=900&q=80',
      hostName: '暂无主持~',
      heat: '1100',
      tag: '派单',
      locked: true,
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom + 96;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F3FF),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF1E8FF), Color(0xFFF7F7FC), Color(0xFFF6F7FB)],
            stops: [0.0, 0.42, 1.0],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                    child: Row(
                      children: [
                        const _HeaderTab(label: '点Ta', active: false),
                        const SizedBox(width: 18),
                        const _HeaderTab(label: '派单厅', active: true),
                        const SizedBox(width: 18),
                        const _HeaderTab(label: '树洞', active: false),
                        const SizedBox(width: 18),
                        const _HeaderTab(label: '休闲玩', active: false),
                        const Spacer(),
                        _RoundIconButton(
                          icon: Icons.search_rounded,
                          onTap: () {},
                        ),
                        const SizedBox(width: 10),
                        _RoundIconButton(
                          icon: Icons.emoji_events_outlined,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(16, 2, 16, bottomPadding),
                      children: [
                        _TopHeroGrid(rooms: _rooms.take(3).toList()),
                        const SizedBox(height: 16),
                        ...List.generate(_rooms.length - 3, (index) {
                          final room = _rooms[index + 3];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: _DispatchRoomCard(
                              room: room,
                              selected: _selectedIndex == index + 3,
                              onTap: () =>
                                  setState(() => _selectedIndex = index + 3),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: _BottomDockPreview(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderTab extends StatelessWidget {
  const _HeaderTab({required this.label, required this.active});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: active ? 24 : 17,
        fontWeight: active ? FontWeight.w900 : FontWeight.w700,
        color: active ? const Color(0xFF111111) : const Color(0xFF8B8B8B),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.90),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, size: 22, color: const Color(0xFF222222)),
        ),
      ),
    );
  }
}

class _TopHeroGrid extends StatelessWidget {
  const _TopHeroGrid({required this.rooms});

  final List<_DispatchRoomItem> rooms;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < rooms.length; i++) ...[
          Expanded(child: _TopHeroCard(room: rooms[i])),
          if (i != rooms.length - 1) const SizedBox(width: 10),
        ],
      ],
    );
  }
}

class _TopHeroCard extends StatelessWidget {
  const _TopHeroCard({required this.room});

  final _DispatchRoomItem room;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBDA8FF).withValues(alpha: 0.16),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 0.82,
                  child: Image.network(
                    room.coverUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _fallbackCover(room.rank),
                  ),
                ),
              ),
              if (room.rank != null)
                Positioned(
                  left: 0,
                  top: 0,
                  child: _RankBadge(rank: room.rank!),
                ),
              Positioned(
                right: 8,
                bottom: 8,
                child: _HeatBadge(text: room.heat),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              _SmallTag(text: room.tag),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  room.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF222222),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.person_rounded,
                size: 16,
                color: Color(0xFFBEBEBE),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  room.hostName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9A9A9A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fallbackCover(int? rank) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2F2B3F), Color(0xFF6B5AED)],
        ),
      ),
      child: Center(
        child: Icon(
          rank == 1 ? Icons.phone_iphone_rounded : Icons.image_rounded,
          color: Colors.white.withValues(alpha: 0.75),
          size: 36,
        ),
      ),
    );
  }
}

class _RankBadge extends StatelessWidget {
  const _RankBadge({required this.rank});

  final int rank;

  @override
  Widget build(BuildContext context) {
    final colors = switch (rank) {
      1 => const [Color(0xFFFFD66B), Color(0xFFFFB34D)],
      2 => const [Color(0xFFDBE4FF), Color(0xFFA9B7FF)],
      3 => const [Color(0xFFFFD9B0), Color(0xFFFFB46B)],
      _ => const [Color(0xFFEDE3FF), Color(0xFFCDB8FF)],
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TOP',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          Text(
            '$rank',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeatBadge extends StatelessWidget {
  const _HeatBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEFEF).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_fire_department_rounded,
            color: Color(0xFFFF5A6A),
            size: 14,
          ),
          const SizedBox(width: 2),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: Color(0xFFFF5A6A),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallTag extends StatelessWidget {
  const _SmallTag({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EFFF),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Color(0xFF7A5CFF),
        ),
      ),
    );
  }
}

class _DispatchRoomCard extends StatelessWidget {
  const _DispatchRoomCard({
    required this.room,
    required this.selected,
    required this.onTap,
  });

  final _DispatchRoomItem room;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 132,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.94),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFBFA8FF).withValues(alpha: 0.12),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: selected ? const Color(0xFFE3CFFF) : const Color(0xFFF2ECFF),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: 108,
                    height: 108,
                    child: Image.network(
                      room.coverUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFCBB8FF), Color(0xFFF1D2F2)],
                          ),
                        ),
                        child: const Icon(
                          Icons.image_rounded,
                          color: Colors.white70,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(left: 8, top: 8, child: _SmallTag(text: room.tag)),
                if (room.locked)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.lock_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            room.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF222222),
                              height: 1.1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _HeatBadge(text: room.heat),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_rounded,
                          size: 18,
                          color: Color(0xFFD2D2D2),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          room.hostName,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFFB2B2B2),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomDockPreview extends StatelessWidget {
  const _BottomDockPreview();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 8,
        ),
        child: Container(
          width: 230,
          height: 76,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.78),
            borderRadius: BorderRadius.circular(38),
            border: Border.all(color: Colors.white.withValues(alpha: 0.9)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFBDA8FF).withValues(alpha: 0.22),
                blurRadius: 26,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _DockItem(icon: Icons.home_outlined, label: '首页', active: false),
              _DockItem(
                icon: Icons.star_border_rounded,
                label: '圈子',
                active: false,
              ),
              _DockCenterButton(),
              _DockItem(
                icon: Icons.chat_bubble_outline_rounded,
                label: '消息',
                active: false,
              ),
              _DockItem(
                icon: Icons.person_outline_rounded,
                label: '我的',
                active: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DockItem extends StatelessWidget {
  const _DockItem({
    required this.icon,
    required this.label,
    required this.active,
  });

  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 22,
          color: active ? const Color(0xFF7A5CFF) : const Color(0xFFB8B8B8),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: active ? const Color(0xFF7A5CFF) : const Color(0xFFB8B8B8),
          ),
        ),
      ],
    );
  }
}

class _DockCenterButton extends StatelessWidget {
  const _DockCenterButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD7B5), Color(0xFFFF6FB3), Color(0xFF8A6CFF)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF7AB6).withValues(alpha: 0.28),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(Icons.face_rounded, color: Colors.white, size: 28),
    );
  }
}

class _DispatchRoomItem {
  const _DispatchRoomItem({
    required this.title,
    required this.coverUrl,
    required this.hostName,
    required this.heat,
    required this.tag,
    this.rank,
    this.locked = false,
    this.top = false,
  });

  final int? rank;
  final String title;
  final String coverUrl;
  final String hostName;
  final String heat;
  final String tag;
  final bool locked;
  final bool top;
}
