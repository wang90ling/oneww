import 'package:flutter/material.dart';

import '../circle/circle_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

class AppShellPage extends StatefulWidget {
  const AppShellPage({super.key});

  @override
  State<AppShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends State<AppShellPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),//首页
    CirclePage(),//圈子
    //_SimpleTabPage(title: '圈子', subtitle: '圈子内容正在建设中'),
    _SimpleTabPage(title: '树洞', subtitle: '树洞内容正在建设中', showCenterStyle: true),
    _SimpleTabPage(title: '消息', subtitle: '消息内容正在建设中'),
    ProfilePage(),//我的模块
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _BottomNavBar(
        currentIndex: _currentIndex,
        onChanged: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.currentIndex, required this.onChanged});

  final int currentIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 68,
          child: Row(
            children: [
              _BottomTab(
                icon: Icons.home_rounded,
                label: '首页',
                selected: currentIndex == 0,
                onTap: () => onChanged(0),
              ),
              _BottomTab(
                icon: Icons.circle_outlined,
                label: '圈子',
                selected: currentIndex == 1,
                onTap: () => onChanged(1),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () => onChanged(2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFFF6A7FF), Color(0xFFB06BFF), Color(0xFFFF85D6)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFB06BFF).withValues(alpha: 0.35),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 30),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '树洞',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: currentIndex == 2 ? colorScheme.primary : colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _BottomTab(
                icon: Icons.message_outlined,
                label: '消息',
                selected: currentIndex == 3,
                onTap: () => onChanged(3),
              ),
              _BottomTab(
                icon: Icons.person_outline_rounded,
                label: '我的',
                selected: currentIndex == 4,
                onTap: () => onChanged(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomTab extends StatelessWidget {
  const _BottomTab({required this.icon, required this.label, required this.selected, required this.onTap});

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = selected ? colorScheme.primary : colorScheme.onSurfaceVariant;

    return Expanded(
      child: InkResponse(
        onTap: onTap,
        radius: 28,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleTabPage extends StatelessWidget {
  const _SimpleTabPage({required this.title, required this.subtitle, this.showCenterStyle = false});

  final String title;
  final String subtitle;
  final bool showCenterStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                showCenterStyle ? Icons.chat_bubble_rounded : Icons.construction_rounded,
                size: 54,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                subtitle+'wangling',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
