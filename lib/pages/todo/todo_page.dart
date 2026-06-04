import 'package:flutter/material.dart';

import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_section_title.dart';
import '../../models/todo_item.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<TodoItem> _items = [
    TodoItem(title: '搭建项目目录'),
    TodoItem(title: '添加网络请求封装'),
    TodoItem(title: '整理页面包结构'),
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addItem() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _items.add(TodoItem(title: text));
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('待办')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const AppSectionTitle(
            title: '待办页面',
            subtitle: '示例页面包，适合承载列表、表单、编辑等业务',
          ),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: '输入待办事项',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _addItem,
                    child: const Text('添加待办'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ..._items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Row(
                  children: [
                    Checkbox(
                      value: item.done,
                      onChanged: (value) {
                        setState(() {
                          item.done = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        item.title,
                        style: TextStyle(
                          decoration: item.done
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _items.remove(item);
                        });
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
