import 'package:flutter/material.dart';

import '../../models/home_recommend.dart';

class PersonalDetailPage extends StatelessWidget {
  const PersonalDetailPage({super.key, required this.record});

  final UserRecord record;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final name = record.nickName.isEmpty ? '匿名陪玩' : record.nickName;
    final price = record.orderAmount == 0 ? 200 : record.orderAmount;
    final avatar = record.avatar;
    final coverImage = record.coverImage.isNotEmpty ? record.coverImage : record.avatar;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FB),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _DetailHeader(name: name, avatar: avatar, coverImage: coverImage),
            ),
            SliverToBoxAdapter(
              child: Transform.translate(
                offset: const Offset(0, -30),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF7F5FB),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6F56E8).withValues(alpha: 0.08),
                          blurRadius: 26,
                          offset: const Offset(0, -6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(1, 30, 1, 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _InfoRow(icon: Icons.verified_rounded, title: '官方审核', subtitle: '官方审核认证'),
                          const SizedBox(height: 1),
                          _InfoRow(icon: Icons.emoji_events_rounded, title: '娱乐搭子', subtitle: '娱乐搭子'),
                          const SizedBox(height: 1),
                          _InfoRow(icon: Icons.shield_rounded, title: '订单保障', subtitle: '1 1 6 7 7 7 8 123'),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left:10,bottom: 6),
                            child: Text('游戏价格',style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, color: colorScheme.onSurface, fontSize: 16)),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:10,bottom: 6),
                                child: Text('$price', style: const TextStyle(fontSize: 30, height: 1.0, fontWeight: FontWeight.w900, color: Color(0xFFFF5A5F), letterSpacing: -1.2)),
                              ),
                              const SizedBox(width: 8),
                              const Padding(
                                padding: EdgeInsets.only(left:2,bottom: 6),
                                child: Text('钻/小时', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF3D3D3D))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left:10,bottom: 6),
                            child: Text('游戏能力', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, color: colorScheme.onSurface, fontSize: 18)),
                          ),

                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.only(left:10,bottom: 6),
                            child: Text(record.categoryName.isEmpty ? '无敌' : record.categoryName, style: theme.textTheme.titleMedium?.copyWith(color: colorScheme.onSurfaceVariant, fontSize: 16, fontWeight: FontWeight.w500)),
                          ),

                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AspectRatio(
                              aspectRatio: 1.8,
                              child: coverImage.isNotEmpty
                                  ? Image.network(coverImage, fit: BoxFit.cover)
                                  : Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [Color(0xFFEDE7F6), Color(0xFFF7F1FF)],
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.image_rounded, size: 56, color: Color(0xFFB8A6D9)),
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: Container(

                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(28),
                                    border: Border.all(color: const Color(0xFFE8DFFF), width: 1.1),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF7A5CFF).withValues(alpha: 0.06),
                                        blurRadius: 14,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                                      foregroundColor: const Color(0xFF8E7AE5),
                                    ),
                                    child: const Text('下单', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    gradient: const LinearGradient(colors: [Color(0xFF5DB2FF), Color(0xFFCF4CFF)]),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFFB154FF).withValues(alpha: 0.22),
                                        blurRadius: 16,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 20),
                                        SizedBox(width: 8),
                                        Text('聊天', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.name, required this.avatar, required this.coverImage});

  final String name;
  final String avatar;
  final String coverImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          coverImage.isNotEmpty
              ? Image.network(coverImage, fit: BoxFit.cover)
              : Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFB8A0FF), Color(0xFFF1D2F2)],
                    ),
                  ),
                ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withValues(alpha: 0.18), Colors.transparent, const Color(0xFFF7F5FB).withValues(alpha: 0.25)],
                stops: const [0.0, 0.62, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 2,
            child: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            ),
          ),
          Positioned(
            right: 14,
            top: 12,
            child: Row(
              children: [
                _HeaderChip(label: '主页', onTap: () {}),
                const SizedBox(width: 10),
                _HeaderDots(onTap: () {}),
              ],
            ),
          ),
          Positioned(
            left: 10,
            bottom: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 14, offset: const Offset(0, 7))],
                        image: avatar.isNotEmpty ? DecorationImage(image: NetworkImage(avatar), fit: BoxFit.cover) : null,
                        color: const Color(0xFFF0EBFF),
                      ),
                      child: avatar.isEmpty ? const Icon(Icons.person_rounded, size: 38, color: Color(0xFF8E7AE5)) : null,
                    ),
                    Positioned(
                      right: 4,
                      bottom: 8,
                      child: Container(width: 10, height: 10, decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFF41D77A), border: Border.all(color: Colors.white, width: 2))),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, height: 1.05)),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        _PillTag(text: 'IP 北京'),
                        SizedBox(width: 8),
                        _PillTag(text: 'ID 1001837'),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        _PillTag(text: '娱乐搭子', accent: true),
                        SizedBox(width: 8),
                        _PillTag(text: '认证'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 18,
            bottom: 120,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.18), borderRadius: BorderRadius.circular(999)),
              child: const Row(
                children: [
                  Icon(Icons.play_arrow_rounded, color: Colors.white, size: 18),
                  SizedBox(width: 6),
                  Icon(Icons.graphic_eq_rounded, color: Colors.white, size: 18),
                  SizedBox(width: 6),
                  Text('5"', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF9FF),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: const Color(0xFFF0EAFD)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFFB79CFF)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$title  $subtitle',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: colorScheme.onSurface),
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: colorScheme.outline),
        ],
      ),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  const _HeaderChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.18),
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}

class _HeaderDots extends StatelessWidget {
  const _HeaderDots({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.18),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: const SizedBox(
          width: 40,
          height: 40,
          child: Icon(Icons.more_horiz_rounded, color: Colors.white),
        ),
      ),
    );
  }
}

class _PillTag extends StatelessWidget {
  const _PillTag({required this.text, this.accent = false});

  final String text;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: accent ? const Color(0xFF7A5CFF) : Colors.white.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }
}
