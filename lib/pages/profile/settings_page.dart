import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
        elevation: 0,
        title: const Text('设置'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _HeaderCard(),
          SizedBox(height: 16),
          _SettingsGroup(
            title: '账号与安全',
            items: [
              _SettingsRowItem(label: '手机号绑定', subtitle: '已绑定手机号'),
              _SettingsRowItem(label: '修改密码', subtitle: '建议定期更新密码'),
              _SettingsRowItem(label: '登录设备', subtitle: '管理当前登录设备'),
            ],
          ),
          SizedBox(height: 14),
          _SettingsGroup(
            title: '偏好设置',
            items: [
              _SettingsRowItem(label: '消息通知', subtitle: '推送与提醒设置'),
              _SettingsRowItem(label: '隐私设置', subtitle: '资料展示与权限管理'),
              _SettingsRowItem(label: '黑名单管理', subtitle: '屏蔽与拉黑记录'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: const Color(0xFF7A5CFF).withValues(alpha: 0.18), blurRadius: 18, offset: const Offset(0, 10))],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('设置中心', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('管理账号、安全、通知和隐私权限', style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.title, required this.items});

  final String title;
  final List<_SettingsRowItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 14, offset: const Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF222222))),
          const SizedBox(height: 12),
          ...items.expand((item) sync* {
            yield item;
            if (item != items.last) yield const SizedBox(height: 12);
          }),
        ],
      ),
    );
  }
}

class _SettingsRowItem extends StatelessWidget {
  const _SettingsRowItem({required this.label, required this.subtitle});

  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF222222))),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF7A7A7A))),
            ],
          ),
        ),
        const Icon(Icons.chevron_right_rounded, color: Color(0xFFB0B0B0)),
      ],
    );
  }
}
