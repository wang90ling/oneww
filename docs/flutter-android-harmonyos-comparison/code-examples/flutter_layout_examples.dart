import 'package:flutter/material.dart';

/// 这个文件用于配合文档学习 Flutter 的常用布局与组件。
/// 重点观察：
/// 1. Container 的装饰能力
/// 2. Row / Column 的方向布局
/// 3. Expanded 的自适应能力
/// 4. Stack / Positioned 的层叠布局
/// 5. ListView.builder 的懒加载思想

class FlutterLayoutExamplesPage extends StatelessWidget {
  const FlutterLayoutExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Layout Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _CardExampleSection(),
          SizedBox(height: 16),
          _RowExampleSection(),
          SizedBox(height: 16),
          _StackExampleSection(),
          SizedBox(height: 16),
          _ListExampleSection(),
        ],
      ),
    );
  }
}

class _CardExampleSection extends StatelessWidget {
  const _CardExampleSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: const [
          CircleAvatar(
            radius: 24,
            child: Icon(Icons.person),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wang Ling',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'A common card-style layout in Flutter.',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _RowExampleSection extends StatelessWidget {
  const _RowExampleSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.favorite, color: Colors.red),
          Icon(Icons.share, color: Colors.blue),
        ],
      ),
    );
  }
}

class _StackExampleSection extends StatelessWidget {
  const _StackExampleSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const Positioned(
          left: 16,
          top: 16,
          child: Text(
            'Stack Overlay',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text('Action'),
          ),
        ),
      ],
    );
  }
}

class _ListExampleSection extends StatelessWidget {
  const _ListExampleSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text('Item $index'),
            subtitle: const Text('ListView.builder example'),
          );
        },
      ),
    );
  }
}
