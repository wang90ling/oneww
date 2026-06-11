import 'package:flutter/material.dart';

import '../../core/helpers/auth_storage.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_section_title.dart';
import '../login/login_page.dart';

///我的模块
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    await AuthStorage.clearSession();
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSectionTitle(
                  title: '个人中心',
                  subtitle: '用于承载用户信息、设置、关于等页面',
                ),
                const SizedBox(height: 12),
                FutureBuilder<Map<String, dynamic>?>(
                  future: AuthStorage.getUserInfo(),
                  builder: (context, snapshot) {
                    final userInfo = snapshot.data;
                    final name = userInfo?['name']?.toString() ?? userInfo?['nickname']?.toString() ?? '未命名用户';
                    final phone = userInfo?['telephone']?.toString() ?? userInfo?['phone']?.toString() ?? '';

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('用户名：$name'),
                        if (phone.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text('手机号：$phone'),
                        ],
                        const SizedBox(height: 12),
                        const Text('这里可以放头像、昵称、积分、设置入口等内容。'),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => _handleLogout(context),
                    child: const Text('退出登录'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
