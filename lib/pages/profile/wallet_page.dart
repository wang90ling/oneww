import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
        elevation: 0,
        title: const Text('钱包'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _BalanceCard(),
          SizedBox(height: 16),
          _SectionTitle(title: '钱包功能', subtitle: '充值、提现、明细一目了然'),
          SizedBox(height: 12),
          _WalletActionList(),
        ],
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

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
          Text('余额(元)', style: TextStyle(color: Colors.white70, fontSize: 13)),
          SizedBox(height: 8),
          Text('128.60', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900)),
          SizedBox(height: 4),
          Text('支持充值、提现和消费明细查看', style: TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF222222))),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF7A7A7A))),
      ],
    );
  }
}

class _WalletActionList extends StatelessWidget {
  const _WalletActionList();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _WalletActionTile(title: '充值', subtitle: '立即补充余额', icon: Icons.add_card_rounded),
        SizedBox(height: 12),
        _WalletActionTile(title: '提现', subtitle: '申请余额提现', icon: Icons.payments_outlined),
        SizedBox(height: 12),
        _WalletActionTile(title: '账单明细', subtitle: '查看收入和支出记录', icon: Icons.receipt_long_rounded),
      ],
    );
  }
}

class _WalletActionTile extends StatelessWidget {
  const _WalletActionTile({required this.title, required this.subtitle, required this.icon});
  final String title;
  final String subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 14, offset: const Offset(0, 6))]),
      child: Row(children: [Container(width: 46, height: 46, decoration: BoxDecoration(color: const Color(0xFFF5EEFF), borderRadius: BorderRadius.circular(14)), child: const Icon(Icons.account_balance_wallet_rounded, color: Color(0xFF7A5CFF))), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF222222))), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF7A7A7A)))])), const Icon(Icons.chevron_right_rounded, color: Color(0xFFB0B0B0))]),
    );
  }
}
