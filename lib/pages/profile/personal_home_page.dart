import 'package:flutter/material.dart';

import '../../core/widgets/app_card.dart';
import '../../models/user_detail_response_entity.dart';

class PersonalHomePage extends StatelessWidget {
  const PersonalHomePage({super.key, this.userInfo});

  final UserDetailResponseData? userInfo;

  @override
  Widget build(BuildContext context) {
    final name = _displayName;
    final coverUrl = _firstNonEmpty([userInfo?.coverImage, userInfo?.avatar]);
    final avatarUrl = _firstNonEmpty([userInfo?.avatar, userInfo?.coverImage]);
    final location = _nonEmptyOrFallback(userInfo?.hometown, '北京');
    final userId = userInfo?.userNo.isNotEmpty == true
        ? userInfo!.userNo
        : (userInfo?.userId.toString() ?? '1002563');
    final level = userInfo?.level.toString() ?? '2';
    final bio = _nonEmptyOrFallback(userInfo?.introduced, '这家伙很懒，什么都没有留下~');
    final giftCount = userInfo?.interestLabel.length ?? 63;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3FB),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: const Color(0xFF111117),
              elevation: 0,
              pinned: true,
              stretch: true,
              expandedHeight: 310,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _CircleActionButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.of(context).maybePop(),
                ),
              ),
              leadingWidth: 64,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: _CircleActionButton(
                    icon: Icons.edit_outlined,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('资料编辑页暂未接入')),
                      );
                    },
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: _ProfileCover(
                  coverImageUrl: coverUrl,
                  avatarUrl: avatarUrl,
                  name: name,
                  location: location,
                  userId: userId,
                  level: level,
                  bio: bio,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: const Color(0xFFF6F3FB),
                child: const Padding(
                  padding: EdgeInsets.only(top: 2, left: 10, right: 10),
                  child: _ProfileTabs(),
                ),
              ),
            ),
          ],
          body: Container(
            color: const Color(0xFFF6F3FB),
            child: TabBarView(
              children: [
                ListView(
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 24),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _ProfileSection(
                      title: '礼物墙',
                      trailing: _SectionCount(countText: giftCount.toString(), totalText: '296'),
                      child: SizedBox(
                        height: 130,
                        child: ListView.separated(
                          padding: const EdgeInsets.only(top: 8, bottom: 4),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = _giftWallItems[index % _giftWallItems.length];
                            return _GiftWallCard(item: item);
                          },
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemCount: _giftWallItems.length,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    _ProfileSection(
                      title: 'Ta的动态',
                      child: _EmptyDynamicsState(userName: name),
                    ),
                  ],
                ),
                ListView(
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 24),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _CpSummaryCard(
                      name: name,
                      userId: userId,
                      level: level,
                      location: location,
                    ),
                    const SizedBox(height: 14),
                    _ProfileSection(
                      title: '关系信息',
                      child: Column(
                        children: const [
                          _RelationInfoTile(
                            title: '当前状态',
                            value: '未绑定 CP',
                            icon: Icons.favorite_border_rounded,
                          ),
                          SizedBox(height: 12),
                          _RelationInfoTile(
                            title: '匹配进度',
                            value: '0 / 100',
                            icon: Icons.track_changes_rounded,
                          ),
                          SizedBox(height: 12),
                          _RelationInfoTile(
                            title: '绑定时间',
                            value: '暂无',
                            icon: Icons.schedule_rounded,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    _ProfileSection(
                      title: '绑定入口',
                      child: Column(
                        children: [
                          _CpActionCard(
                            title: '立即绑定 CP',
                            subtitle: '提交你的 CP 信息并开始配对',
                            icon: Icons.link_rounded,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('CP 绑定功能暂未接入')),
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          _CpActionCard(
                            title: '查看匹配记录',
                            subtitle: '查看历史匹配、申请和沟通记录',
                            icon: Icons.history_rounded,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('匹配记录页暂未接入')),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    _ProfileSection(
                      title: '历史记录',
                      child: Column(
                        children: const [
                          _HistoryItem(title: '绑定申请', subtitle: '等待对方确认', timeText: '2026-06-29'),
                          SizedBox(height: 10),
                          _HistoryItem(title: 'CP 互动', subtitle: '暂无更多记录', timeText: '2026-06-28'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get _displayName {
    final nickName = userInfo?.nickName.trim() ?? '';
    final realName = userInfo?.name.trim() ?? '';
    if (nickName.isNotEmpty) return nickName;
    if (realName.isNotEmpty) return realName;
    return '热血星芒使YCvUd';
  }
}

class _ProfileCover extends StatelessWidget {
  const _ProfileCover({
    required this.coverImageUrl,
    required this.avatarUrl,
    required this.name,
    required this.location,
    required this.userId,
    required this.level,
    required this.bio,
  });

  final String coverImageUrl;
  final String avatarUrl;
  final String name;
  final String location;
  final String userId;
  final String level;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: coverImageUrl.isNotEmpty
              ? Image.network(
                  coverImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _coverFallback(),
                )
              : _coverFallback(),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.04),
                  Colors.black.withValues(alpha: 0.20),
                  const Color(0xFF111117).withValues(alpha: 0.88),
                ],
                stops: const [0.0, 0.58, 1.0],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _AvatarHero(imageUrl: avatarUrl),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.05,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 5,
                            runSpacing: 8,
                            children: [
                              _TagChip(text: location, icon: Icons.location_on_outlined),
                              _TagChip(text: 'ID $userId', icon: Icons.badge_outlined),
                              _TagChip(text: 'Lv.$level', icon: Icons.workspace_premium_outlined),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  bio,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.92),
                    fontSize: 13,
                    height: 1.45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _LevelBadge(level: level),
                    const Spacer(),
                    _MiniAction(text: '关注', icon: Icons.add_rounded, onTap: () {}),
                    const SizedBox(width: 10),
                    _MiniAction(text: '私信', icon: Icons.chat_bubble_outline_rounded, onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _coverFallback() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F172A), Color(0xFF5B3D8F), Color(0xFFB0597A)],
        ),
      ),
    );
  }
}

class _ProfileTabs extends StatelessWidget {
  const _ProfileTabs();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorColor: Color(0xFF7A5CFF),
        indicatorWeight: 2,
        labelColor: Color(0xFF222222),
        unselectedLabelColor: Color(0xFF9A9AA3),
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        tabAlignment: TabAlignment.start,
        tabs: [
          Tab(text: '资料'),
          Tab(text: 'CP'),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({
    required this.title,
    required this.child,
    this.trailing,
  });

  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF111111),
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

class _SectionCount extends StatelessWidget {
  const _SectionCount({required this.countText, required this.totalText});

  final String countText;
  final String totalText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$countText/$totalText',
          style: const TextStyle(fontSize: 14, color: Color(0xFF868696), fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: 2),
        const Icon(Icons.chevron_right_rounded, color: Color(0xFFB7B7C5), size: 20),
      ],
    );
  }
}

class _GiftWallCard extends StatelessWidget {
  const _GiftWallCard({required this.item});

  final _GiftWallItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
        child: Column(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: item.gradient),
              ),
              child: Center(
                child: Text(
                  item.shortText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                    height: 1.1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5A5A5A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyDynamicsState extends StatelessWidget {
  const _EmptyDynamicsState({required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF7F4FF), Color(0xFFFDFDFF)],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 94,
                  height: 94,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7A5CFF).withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.auto_awesome_rounded, size: 42, color: Color(0xFF9A86FF)),
                ),
                const SizedBox(height: 14),
                const Text(
                  '暂无数据',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFB0B0B8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '$userName 还没有发布动态',
            style: const TextStyle(fontSize: 13, color: Color(0xFF8A8A96)),
          ),
        ],
      ),
    );
  }
}

class _CpSummaryCard extends StatelessWidget {
  const _CpSummaryCard({
    required this.name,
    required this.userId,
    required this.level,
    required this.location,
  });

  final String name;
  final String userId;
  final String level;
  final String location;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CP 概览',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF222222)),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFF4EEFF), Color(0xFFFFF3F8)]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(Icons.favorite_rounded, color: Color(0xFFFF5FA2), size: 32),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF222222)),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'ID $userId · $location · Lv.$level',
                        style: const TextStyle(fontSize: 13, color: Color(0xFF666666)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(child: _CpStatTile(title: '配对状态', value: '未绑定')),
              SizedBox(width: 12),
              Expanded(child: _CpStatTile(title: '互动天数', value: '0 天')),
            ],
          ),
        ],
      ),
    );
  }
}

class _CpStatTile extends StatelessWidget {
  const _CpStatTile({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF0ECF8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Color(0xFF8A8A96), fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF222222))),
        ],
      ),
    );
  }
}

class _RelationInfoTile extends StatelessWidget {
  const _RelationInfoTile({required this.title, required this.value, required this.icon});

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF2EDF8)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F4FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF7A5CFF), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, color: Color(0xFF8A8A96), fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF222222))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CpActionCard extends StatelessWidget {
  const _CpActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7A5CFF).withValues(alpha: 0.16),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, color: Colors.white, size: 26),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white)),
                  const SizedBox(height: 6),
                  Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.92), height: 1.4)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right_rounded, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({required this.title, required this.subtitle, required this.timeText});

  final String title;
  final String subtitle;
  final String timeText;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F1FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.history_rounded, color: Color(0xFF7A5CFF), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF222222))),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF767676))),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(timeText, style: const TextStyle(fontSize: 12, color: Color(0xFF9A9AA3))),
        ],
      ),
    );
  }
}

class _CircleActionButton extends StatelessWidget {
  const _CircleActionButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.18),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

class _AvatarHero extends StatelessWidget {
  const _AvatarHero({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipOval(
        child: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _avatarFallback(),
              )
            : _avatarFallback(),
      ),
    );
  }

  Widget _avatarFallback() {
    return Container(
      color: const Color(0xFFF1E9FF),
      child: const Icon(Icons.person_rounded, size: 42, color: Color(0xFF9C7CF3)),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelBadge extends StatelessWidget {
  const _LevelBadge({required this.level});

  final String level;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF4ED0BA), Color(0xFF2BA8A3)]),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        'Lv.$level',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _MiniAction extends StatelessWidget {
  const _MiniAction({required this.text, required this.icon, required this.onTap});

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: Colors.white),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GiftWallItem {
  const _GiftWallItem({
    required this.title,
    required this.shortText,
    required this.gradient,
  });

  final String title;
  final String shortText;
  final List<Color> gradient;
}

final List<_GiftWallItem> _giftWallItems = [
  const _GiftWallItem(
    title: '魔羯座',
    shortText: '魔\n羯',
    gradient: [Color(0xFF6454FF), Color(0xFF9D78FF)],
  ),
  const _GiftWallItem(
    title: '百万',
    shortText: '一\n百万',
    gradient: [Color(0xFF7EE7DB), Color(0xFF6FC0B8)],
  ),
  const _GiftWallItem(
    title: '射手座',
    shortText: '射\n手',
    gradient: [Color(0xFFFFB574), Color(0xFFFF8A4A)],
  ),
  const _GiftWallItem(
    title: '双鱼座',
    shortText: '双\n鱼',
    gradient: [Color(0xFF4D67F6), Color(0xFF8AA0FF)],
  ),
  const _GiftWallItem(
    title: '月下漫步',
    shortText: '月\n下',
    gradient: [Color(0xFFF0DCAA), Color(0xFFE6B86A)],
  ),
];

String _firstNonEmpty(List<String?> values) {
  for (final value in values) {
    final text = value?.trim() ?? '';
    if (text.isNotEmpty) return text;
  }
  return '';
}

String _nonEmptyOrFallback(String? value, String fallback) {
  final text = value?.trim() ?? '';
  return text.isNotEmpty ? text : fallback;
}
