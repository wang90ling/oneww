import 'package:flutter/material.dart';

import '../../core/helpers/auth_storage.dart';
import '../../core/helpers/token_sync_service.dart';
import '../../core/widgets/app_card.dart';
import '../../models/user_detail_response_entity.dart';
import '../../repositories/profile_me_repository.dart';
import '../login/login_page.dart';
import 'cp_page.dart';
import 'help_center_page.dart';
import 'order_page.dart';
import 'personal_home_page.dart';
import 'settings_page.dart';
import '../roomlive/mine_room_page.dart';
import 'wallet_page.dart';

/// 我的模块
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileMeRepository _profileMeRepository;
  late Future<UserDetailResponseEntity?> _userInfoFuture;

  @override
  void initState() {
    super.initState();
    _profileMeRepository = ProfileMeRepository();
    _userInfoFuture = _loadUserInfo();
  }

  Future<UserDetailResponseEntity?> _loadUserInfo() async {
    try {
      return await _profileMeRepository.getUserInfo();
    } catch (error, stackTrace) {
      debugPrint('Profile getUserInfo error: $error');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }

  void _reloadUserInfo() {
    setState(() {
      _userInfoFuture = _loadUserInfo();
    });
  }

  Future<void> _handleLogout() async {
    await AuthStorage.clearSession();
    // 清除 Android Native 端的 token
    await TokenSyncService.clearNativeToken();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  void _pushPage(Widget page) {
    if (!mounted) return;
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  void _openFeaturePage({
    required String title,
    required String subtitle,
    IconData icon = Icons.construction_rounded,
  }) {
    _pushPage(_FeaturePage(title: title, subtitle: subtitle, icon: icon));
  }

  String _formatAvatarUrl(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return '';
    if (text.startsWith('http://') || text.startsWith('https://')) return text;
    return text;
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FB),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF2D8FF), Color(0xFFF7EEF9), Color(0xFFF7F5FB)],
            stops: [0.0, 0.22, 1.0],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: FutureBuilder<UserDetailResponseEntity?>(
            future: _userInfoFuture,
            builder: (context, snapshot) {
              final response = snapshot.data;
              final userInfo = response?.data;
              final nickName = userInfo?.nickName ?? '';
              final realName = userInfo?.name ?? '';
              final displayName = nickName.trim().isNotEmpty ? nickName.trim() : realName.trim();
              final name = displayName.isNotEmpty ? displayName : '热血星芒使YC...';
              final phone = (userInfo?.telephone ?? '').trim();
              final userId = userInfo?.userNo.toString() ?? '1002563';
              final level = userInfo?.level.toString() ?? '2';
              final avatar = _formatAvatarUrl(userInfo?.avatar);
              final followCount = '2';
              final fanCount = '1';
              final cpCount = '0';

              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                      child: _ProfileHeader(
                        name: name,
                        userId: userId,
                        level: level,
                        avatar: avatar,
                        onPersonalHomeTap: () => _pushPage(
                          PersonalHomePage(userInfo: userInfo),
                        ),
                        onCpTap: () => _pushPage(CpPage(userInfo: userInfo)),
                        cpCount: cpCount,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _StatsRow(followCount: followCount, fanCount: fanCount),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _QuickActionsCard(
                        onOrdersTap: () => _pushPage(const OrderPage()),
                        onCouponsTap: () => _pushPage(CpPage(userInfo: userInfo)),
                        onWalletTap: () => _pushPage(const WalletPage()),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 14)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _SectionCard(
                        title: '更多服务',
                        children: [
                          _ServiceGrid(
                            items: [
                              _ServiceItemData(
                                iconAssetPath: 'assets/images/ic_me_ser_zbzx.webp',
                                label: '装扮中心',
                                gradient: const [Color(0xFF7A5CFF), Color(0xFFB06BFF)],
                                onTap: () => _openFeaturePage(
                                  title: '装扮中心',
                                  subtitle: '这里可展示头像框、气泡、礼物等装扮资源',
                                  icon: Icons.checkroom_outlined,
                                ),
                              ),
                              _ServiceItemData(
                                iconAssetPath: 'assets/images/ic_me_ser_pwrz.webp',
                                label: '搭子入驻',
                                gradient: const [Color(0xFFFF5FA2), Color(0xFFFF7D76)],
                                onTap: () => _openFeaturePage(
                                  title: '搭子入驻',
                                  subtitle: '申请成为入驻搭子，开启接单能力',
                                  icon: Icons.auto_awesome_outlined,
                                ),
                              ),
                              _ServiceItemData(
                                iconAssetPath: 'assets/images/ic_me_ser_wdfj.webp',
                                label: '我的房间',
                                gradient: const [Color(0xFFFF62A7), Color(0xFFFF8B7A)],
                                onTap: () => _pushPage(const MineRoomPage()),
                              ),
                              _ServiceItemData(
                                iconAssetPath: 'assets/images/ic_me_ser_dssl.webp',
                                label: '贵族特权',
                                gradient: const [Color(0xFFFFB54C), Color(0xFFFF8A4A)],
                                onTap: () => _openFeaturePage(
                                  title: '贵族特权',
                                  subtitle: '查看贵族等级与专属权益',
                                  icon: Icons.workspace_premium_outlined,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 14)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _SectionCard(
                        title: '支持与帮助',
                        children: [
                          _ServiceGrid(
                            items: [
                              _ServiceItemData(
                                iconAssetPath: 'assets/images/ic_me_helper_kf.webp',
                                label: '联系客服',
                                onTap: () => _openFeaturePage(
                                  title: '联系客服',
                                  subtitle: '这里可接入在线客服或人工客服入口',
                                  icon: Icons.headset_mic_outlined,
                                ),
                              ),
                              _ServiceItemData(
                                iconAssetPath: 'assets/images/ic_me_helper_jb.webp',
                                label: '举报记录',
                                onTap: () => _openFeaturePage(
                                  title: '举报记录',
                                  subtitle: '查看你提交过的举报和处理状态',
                                  icon: Icons.report_gmailerrorred_outlined,
                                ),
                              ),
                              _ServiceItemData(
                                iconAssetPath: 'assets/images/ic_me_helper_center.webp',
                                label: '帮助中心',
                                onTap: () => _pushPage(const HelpCenterPage()),
                              ),
                              _ServiceItemData(
                                iconAssetPath: 'assets/images/ic_me_helper_setting.webp',
                                label: '设置',
                                onTap: () => _pushPage(const SettingsPage()),
                              ),
                              _ServiceItemData(
                                iconAssetPath: 'assets/images/ic_me_helper_kf.webp',
                                label: '专属客服',
                                onTap: () => _openFeaturePage(
                                  title: '专属客服',
                                  subtitle: '你的专属客服与跟进入口',
                                  icon: Icons.support_agent_rounded,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 18)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, bottomPadding + 24),
                      child: AppCard(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    '账号信息',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF222222),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _reloadUserInfo,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5EEFF),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: const Text(
                                      '刷新资料',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF7A5CFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _InfoRow(label: '用户ID', value: userId),
                            const SizedBox(height: 10),
                            _InfoRow(label: '昵称', value: name),
                            if (phone.isNotEmpty) ...[
                              const SizedBox(height: 10),
                              _InfoRow(label: '手机号', value: phone),
                            ],
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF7A5CFF),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: _reloadUserInfo,
                                child: const Text('刷新资料'),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFFFF5A7A),
                                  side: const BorderSide(color: Color(0xFFFFD0DB)),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: _handleLogout,
                                child: const Text('退出登录'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.name,
    required this.userId,
    required this.level,
    required this.avatar,
    required this.onPersonalHomeTap,
    required this.onCpTap,
    required this.cpCount,
  });

  final String name;
  final String userId;
  final String level;
  final String avatar;
  final VoidCallback onPersonalHomeTap;
  final VoidCallback onCpTap;
  final String cpCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    /*  decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF3DAFF), Color(0xFFF7E5F3), Color(0xFFF8E5EE)],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBD8DFF).withValues(alpha: 0.16),
            blurRadius: 26,
            offset: const Offset(0, 12),
          ),
        ],
      ),*/
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: avatar.isNotEmpty
                      ? Image.network(
                          avatar,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => _avatarFallback(),
                        )
                      : _avatarFallback(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF232323),
                              height: 1.05,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onPersonalHomeTap,
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '个人主页',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF8A758D),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFF8A758D)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          'ID:$userId',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF7D7D7D),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.copy_rounded, size: 14, color: Color(0xFF7D7D7D)),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF4DBFA8), Color(0xFF2FA7A1)],
                            ),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'Lv.$level',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _avatarFallback() {
    return Container(
      color: Colors.white,
      child: const Icon(Icons.person_rounded, size: 34, color: Color(0xFFBFA5C8)),
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  const _HeaderActionButton({required this.text, required this.icon, required this.onTap});

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF7A5CFF)),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4A4A4A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  const _MetricItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF262626)),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF7A7A7A), fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.followCount, required this.fanCount});

  final String followCount;
  final String fanCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: _MetricItem(value: followCount, label: '关注')),
          Expanded(child: _MetricItem(value: fanCount, label: '粉丝')),
        ],
      ),
    );
  }
}

class _QuickActionsCard extends StatelessWidget {
  const _QuickActionsCard({
    required this.onOrdersTap,
    required this.onCouponsTap,
    required this.onWalletTap,
  });

  final VoidCallback onOrdersTap;
  final VoidCallback onCouponsTap;
  final VoidCallback onWalletTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: _ActionItem(
              iconAssetPath: 'assets/images/ic_me_dd.webp',
              label: '订单',
              gradient: const [Color(0xFFFF7BC1), Color(0xFFFF5C8A)],
              onTap: onOrdersTap,
            ),
          ),
          Expanded(
            child: _ActionItem(
              iconAssetPath: 'assets/images/ic_me_yhq.webp',
              label: '优惠券',
              gradient: const [Color(0xFF5C8DFF), Color(0xFF7A5CFF)],
              onTap: onCouponsTap,
            ),
          ),
          Expanded(
            child: _ActionItem(
              iconAssetPath: 'assets/images/ic_me_qb.webp',
              label: '钱包',
              gradient: const [Color(0xFFB05CFF), Color(0xFFFF7AD9)],
              onTap: onWalletTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.label,
    required this.gradient,
    required this.onTap,
    this.icon,
    this.iconAssetPath,
  }) : assert(icon != null || iconAssetPath != null,
            'icon 和 iconAssetPath 必须至少提供一个');

  final IconData? icon;
  final String? iconAssetPath;
  final String label;
  final List<Color> gradient;
  final VoidCallback onTap;

  Widget _buildIcon() {
    const iconSize = 32.0;
    const iconColor = Colors.white;

    if (iconAssetPath != null) {
      return Image.asset(
        iconAssetPath!,
        width: iconSize,
        height: iconSize,
        //color: iconColor,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => const Icon(
          Icons.error_outline_rounded,
          size: iconSize,
          color: iconColor,
        ),
      );
    }

    return Icon(icon!, size: iconSize, color: iconColor);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: _buildIcon()),
       /*   Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradient),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: gradient.first.withValues(alpha: 0.22),
                  blurRadius: 14,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(child: _buildIcon()),
          ),*/
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF303030),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Color(0xFF222222),
            ),
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }
}

class _ServiceGrid extends StatelessWidget {
  const _ServiceGrid({required this.items});

  final List<_ServiceItemData> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0,
      runSpacing: 18,
      children: items.asMap().entries.map((entry) {
        final item = entry.value;
        return SizedBox(
          width: (MediaQuery.of(context).size.width - 32 - 24) / 4,
          child: _ServiceItem(
            icon: item.icon,
            iconAssetPath: item.iconAssetPath,
            label: item.label,
            gradient: item.gradient,
            onTap: item.onTap,
            compact: items.length > 4,
          ),
        );
      }).toList(),
    );
  }
}

class _ServiceItemData {
  const _ServiceItemData({
    required this.label,
    required this.onTap,
    this.icon,
    this.iconAssetPath,
    this.gradient,
  }) : assert(icon != null || iconAssetPath != null,
            'icon 和 iconAssetPath 必须至少提供一个');

  final IconData? icon;
  final String? iconAssetPath;
  final String label;
  final VoidCallback onTap;
  final List<Color>? gradient;
}

class _ServiceItem extends StatelessWidget {
  const _ServiceItem({
    required this.label,
    required this.onTap,
    this.icon,
    this.iconAssetPath,
    this.gradient,
    this.compact = false,
  }) : assert(icon != null || iconAssetPath != null,
            'icon 和 iconAssetPath 必须至少提供一个');

  final IconData? icon;
  final String? iconAssetPath;
  final String label;
  final VoidCallback onTap;
  final List<Color>? gradient;
  final bool compact;

  Widget _buildIcon(BuildContext context) {
    final iconSize = 32.0;
    final iconColor = gradient == null ? const Color(0xFF5A5A5A) : Colors.white;

    if (iconAssetPath != null) {
      return Image.asset(
        iconAssetPath!,
        width: iconSize,
        height: iconSize,
        //color: iconColor,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => Icon(
          Icons.error_outline_rounded,
          size: iconSize,
          color: iconColor,
        ),
      );
    }

    return Icon(
      icon!,
      size: iconSize,
      color: iconColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: _buildIcon(context)),
          /*Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: gradient == null ? const Color(0xFFF7F7FA) : Colors.transparent,
              shape: BoxShape.circle,
              gradient: gradient == null ? null : LinearGradient(colors: gradient!),
            ),
            child: Center(child: _buildIcon(context)),
          ),*/
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 72,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF7B7B7B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF222222),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _FeaturePage extends StatelessWidget {
  const _FeaturePage({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
        elevation: 0,
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF7A5CFF).withValues(alpha: 0.18),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 36),
              ),
              const SizedBox(height: 18),
              Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Color(0xFF7A7A7A), height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

