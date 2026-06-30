import 'package:flutter/material.dart';

import '../../core/widgets/app_card.dart';
import '../../models/user_detail_response_entity.dart';

class CpPage extends StatelessWidget {
  const CpPage({super.key, this.userInfo});

  final UserDetailResponseData? userInfo;

  @override
  Widget build(BuildContext context) {
    final name = _displayName;
    final userId = userInfo?.userNo.isNotEmpty == true
        ? userInfo!.userNo
        : (userInfo?.userId.toString() ?? '1002563');
    final level = userInfo?.level.toString() ?? '2';

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
        elevation: 0,
        title: const Text('CP'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        children: [
          AppCard(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CP 状态',
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
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(Icons.favorite_rounded, color: Color(0xFFFF5FA2), size: 30),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '当前暂无绑定 CP',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF222222)),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '绑定后可展示关系资料、纪念日、互动记录和专属权益。',
                              style: TextStyle(fontSize: 13, color: Color(0xFF666666), height: 1.45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '关系信息',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF222222)),
                ),
                const SizedBox(height: 12),
                _InfoTile(title: '昵称', value: name),
                const SizedBox(height: 10),
                _InfoTile(title: '用户ID', value: userId),
                const SizedBox(height: 10),
                _InfoTile(title: '等级', value: 'Lv.$level'),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '绑定入口',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF222222)),
                ),
                const SizedBox(height: 12),
                _ActionButton(
                  title: '立即绑定 CP',
                  subtitle: '提交配对信息并发起绑定申请',
                  icon: Icons.link_rounded,
                  gradient: const [Color(0xFF7A5CFF), Color(0xFFFF6FB3)],
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('CP 绑定功能暂未接入')),
                    );
                  },
                ),
                const SizedBox(height: 12),
                _ActionButton(
                  title: '查看历史记录',
                  subtitle: '查看绑定、沟通和互动历史',
                  icon: Icons.history_rounded,
                  gradient: const [Color(0xFF4ED0BA), Color(0xFF2BA8A3)],
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('历史记录页暂未接入')),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '历史记录',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF222222)),
                ),
                const SizedBox(height: 12),
                const _HistoryRow(title: '绑定申请', subtitle: '等待对方确认', timeText: '2026-06-29'),
                const SizedBox(height: 10),
                const _HistoryRow(title: 'CP 互动', subtitle: '暂无更多记录', timeText: '2026-06-28'),
              ],
            ),
          ),
        ],
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

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7FB),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 13, color: Color(0xFF888888), fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Color(0xFF222222), fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradient),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: gradient.first.withValues(alpha: 0.18),
              blurRadius: 16,
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
          ],
        ),
      ),
    );
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.title, required this.subtitle, required this.timeText});

  final String title;
  final String subtitle;
  final String timeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7FB),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF4EEFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.event_note_rounded, color: Color(0xFF7A5CFF), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF222222))),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF777777))),
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
