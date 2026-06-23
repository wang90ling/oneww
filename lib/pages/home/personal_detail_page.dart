import 'package:flutter/material.dart';

import '../../core/helpers/auth_storage.dart';
import '../../core/network/network_client.dart';
import '../../models/accompany_category_detail_entity.dart';
import '../../models/home_recommend.dart';
import '../../pages/login/login_page.dart';
import '../../viewmodels/home_view_model.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key, required this.record});

  final UserRecord record;

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  late final HomeViewModel _viewModel;
  late final String _categoryId;
  late final String _userId;

  bool _loading = true;
  String? _errorMessage;
  AccompanyCategoryDetailEntity? _detail;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    _categoryId = widget.record.categoryId.toString();
    _userId = widget.record.userId.toString();
    _loadDetail();
  }

  Future<void> _loadDetail() async {
    try {
      final detail = await _viewModel.loadAccompanyCategoryDetail(_categoryId, _userId);
      if (!mounted) return;
      setState(() {
        _detail = detail;
        _loading = false;
        _errorMessage = null;
      });
    } on UnauthorizedException {
      if (!mounted) return;
      await _handleUnauthorized();
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _errorMessage = error.toString();
        _loading = false;
      });
    }
  }

  Future<void> _handleUnauthorized() async {
    await AuthStorage.clearSession();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detail = _detail?.data;
    if (_loading) {
      return const Scaffold(body: SafeArea(child: Center(child: CircularProgressIndicator())));
    }
    if (_errorMessage != null || detail == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F5FB),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline_rounded, size: 42, color: Color(0xFFFF5A5F)),
                  const SizedBox(height: 12),
                  Text(
                    _errorMessage ?? '暂无详情数据',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, color: Color(0xFF3D3D3D), height: 1.4),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadDetail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7A5CFF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                    ),
                    child: const Text('重试'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final labels = _buildLabels(detail);
    final entryGroups = detail.entryGroupDto;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FB),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _DetailHeader(
                name: detail.nickName,
                avatar: detail.avatar,
                coverImage: detail.coverImage,
                ipText: detail.lastLoginCity.isNotEmpty ? detail.lastLoginCity : '北京',
                idText: detail.userNo.isNotEmpty ? detail.userNo : 'ID ${widget.record.userId}',
                labels: labels,
              ),
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
                          for (final entryGroup in entryGroups.take(3)) ...[
                            _InfoRow(
                              icon: Icons.verified_rounded,
                              title: entryGroup.typeName.isNotEmpty ? entryGroup.typeName : '官方审核',
                              subtitle: _entryGroupSubtitle(entryGroup),
                            ),
                            const SizedBox(height: 1),
                          ],
                          if (entryGroups.isEmpty) ...[
                            _InfoRow(icon: Icons.verified_rounded, title: '官方审核', subtitle: '官方审核认证'),
                            const SizedBox(height: 1),
                            _InfoRow(icon: Icons.emoji_events_rounded, title: '娱乐搭子', subtitle: '娱乐搭子'),
                            const SizedBox(height: 1),
                            _InfoRow(icon: Icons.shield_rounded, title: '订单保障', subtitle: '1 1 6 7 7 7 8 123'),
                            const SizedBox(height: 10),
                          ],
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 6),
                            child: Text('游戏价格', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, fontSize: 16)),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, bottom: 6),
                                child: Text('${detail.personCategoryDto.minPriceDto.price}', style: const TextStyle(fontSize: 30, height: 1.0, fontWeight: FontWeight.w900, color: Color(0xFFFF5A5F), letterSpacing: -1.2)),
                              ),
                              const SizedBox(width: 8),
                              const Padding(
                                padding: EdgeInsets.only(left: 2, bottom: 6),
                                child: Text('钻/小时', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF3D3D3D))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 6),
                            child: Text('游戏能力', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, fontSize: 18)),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 6),
                            child: Text(detail.personCategoryDto.categoryName.isNotEmpty ? detail.personCategoryDto.categoryName : '无敌', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AspectRatio(
                                aspectRatio: 1.8,
                                child: _buildGalleryImage(detail),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: _ActionButton(
                                    text: '下单',
                                    backgroundColor: Colors.white,
                                    textColor: const Color(0xFF8E7AE5),
                                    borderColor: const Color(0xFFE8DFFF),
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: _ActionButton(
                                    text: '聊天',
                                    gradient: const LinearGradient(colors: [Color(0xFF5DB2FF), Color(0xFFCF4CFF)]),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
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

  Widget _buildGalleryImage(AccompanyCategoryDetailData detail) {
    final imageUrl = detail.personCategoryDto.fileList.isNotEmpty ? detail.personCategoryDto.fileList.first.fileUrl : detail.coverImage;
    if (imageUrl.isNotEmpty) {
      return Image.network(imageUrl, fit: BoxFit.cover);
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFEDE7F6), Color(0xFFF7F1FF)]),
      ),
      child: const Center(child: Icon(Icons.image_rounded, size: 56, color: Color(0xFFB8A6D9))),
    );
  }

  List<String> _buildLabels(AccompanyCategoryDetailData detail) {
    final labelNames = detail.userLabels.map((e) => e.labelName).where((e) => e.isNotEmpty).toList();
    return labelNames.isEmpty ? const ['娱乐搭子', '认证'] : labelNames.take(2).toList();
  }

  String _entryGroupSubtitle(AccompanyCategoryDetailDataEntryGroupDto entryGroup) {
    if (entryGroup.entries.isEmpty) return entryGroup.typeName;
    return entryGroup.entries.first.content.isNotEmpty ? entryGroup.entries.first.content : entryGroup.entries.first.labelName;
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.name, required this.avatar, required this.coverImage, required this.ipText, required this.idText, required this.labels});

  final String name;
  final String avatar;
  final String coverImage;
  final String ipText;
  final String idText;
  final List<String> labels;

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
                      children: [
                        _PillTag(text: 'IP $ipText'),
                        const SizedBox(width: 8),
                        _PillTag(text: idText),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        _PillTag(text: labels.isNotEmpty ? labels.first : '娱乐搭子', accent: true),
                        const SizedBox(width: 8),
                        _PillTag(text: labels.length > 1 ? labels[1] : '认证'),
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

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.text, required this.onPressed, this.backgroundColor, this.textColor = Colors.white, this.borderColor, this.gradient});

  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final isChat = text == '聊天';
    final decoration = BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(28),
      border: borderColor == null ? null : Border.all(color: borderColor!, width: 1.1),
      gradient: gradient,
      boxShadow: [BoxShadow(color: const Color(0xFF7A5CFF).withValues(alpha: 0.06), blurRadius: 14, offset: const Offset(0, 8))],
    );

    return Container(
      height: 45,
      decoration: decoration,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        ),
        child: isChat
            ? const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 20), SizedBox(width: 8), Text('聊天', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white))])
            : Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
      ),
    );
  }
}
