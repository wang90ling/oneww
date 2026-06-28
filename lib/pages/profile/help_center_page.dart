import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
        elevation: 0,
        title: const Text('帮助中心'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _HelpHeaderCard(),
          SizedBox(height: 16),
          _HelpSection(title: '常见问题', items: [
            _HelpItem(title: '如何修改个人资料？', subtitle: '进入设置或个人中心即可修改。'),
            _HelpItem(title: '如何查看订单？', subtitle: '点击订单页可以查看历史与进行中订单。'),
            _HelpItem(title: '如何提现？', subtitle: '进入钱包页即可查看提现入口。'),
          ]),
          SizedBox(height: 14),
          _HelpSection(title: '联系客服', items: [
            _HelpItem(title: '在线客服', subtitle: '工作时间内可快速获取帮助。'),
            _HelpItem(title: '反馈建议', subtitle: '欢迎提交你的优化建议。'),
          ]),
        ],
      ),
    );
  }
}

class _HelpHeaderCard extends StatelessWidget {
  const _HelpHeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('需要帮助？', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('这里聚合了常见问题和客服入口，方便你快速解决问题。', style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}

class _HelpSection extends StatelessWidget {
  const _HelpSection({required this.title, required this.items});

  final String title;
  final List<_HelpItem> items;

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

class _HelpItem extends StatelessWidget {
  const _HelpItem({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.help_outline_rounded, color: Color(0xFF7A5CFF)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF222222))),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF7A7A7A), height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}
