import 'package:flutter/material.dart';

import '../../core/helpers/app_logger.dart';
import '../../core/helpers/auth_storage.dart';
import '../../core/network/api_service.dart';
import '../../core/network/network_client.dart';
import '../../models/home_category_item.dart';
import '../../models/home_new_recommend_entity.dart';
import '../../models/recommend_request.dart';
import '../login/login_page.dart';
import '../roomlive/dispatching_center_list_page.dart';
import 'personal_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();

  bool _isLoadingCategories = true;
  String? _categoryError;
  List<HomeCategoryItem> _categories = const [];
  int _selectedCategoryIndex = 0;

  bool _isLoadingRecommendList = true;
  String? _recommendListError;
  List<HomeNewRecommendDataRecords> _recommendRecords = const [];

  static const List<String> _homeTabs = <String>[
    '点Ta',
    '派单厅',
    '树洞',
    '休闲玩'
  ];
  int _selectedHomeTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkAuthAndLoadData();
  }

  Future<void> _checkAuthAndLoadData() async {
    final hasToken = await AuthStorage.hasToken();
    AppLogger.info('HomePage Token检查: ${hasToken ? "已登录" : "未登录"}',
        tag: 'wangling');
    if (!hasToken) {
      if (!mounted) return;
      await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginPage()));
      return;
    }
    _loadCategories();
    _getRecommendList();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoadingCategories = true;
      _categoryError = null;
    });
    try {
      final remoteCategories = await _apiService.getCategoryList();
      final mergedCategories = [
        const HomeCategoryItem(
          id: '0',
          categoryName: '推荐',
          categoryType: 'Recommend',
          fileUrl: '',
          backgroundFileUrl: '',
          compensationInfo: '推荐',
          weighted: 999,
          coverImageUrl: '',
          sampleImageUrl: '',
        ),
        ...remoteCategories,
      ];
      if (!mounted) return;
      setState(() {
        _categories = mergedCategories;
        _selectedCategoryIndex =
        mergedCategories.isEmpty ? 0 : _selectedCategoryIndex.clamp(
            0, mergedCategories.length - 1);
      });
    } on UnauthorizedException {
      if (!mounted) return;
      await _handleUnauthorized();
    } catch (_) {
      if (!mounted) return;
      setState(() => _categoryError = '加载游戏分类失败');
    } finally {
      if (!mounted) return;
      setState(() => _isLoadingCategories = false);
    }
  }

  Future<void> _getRecommendList({String? categoryId}) async {
    final effectiveCategoryId = categoryId ??
        (_categories.isNotEmpty ? _categories[_selectedCategoryIndex].id
            .toString() : '');
    setState(() {
      _isLoadingRecommendList = true;
      _recommendListError = null;
    });
    try {
      final homeRecommend = await _apiService.getRecommendList(RecommendRequest(
          pageNo: 1, pageSize: 20, categoryId: effectiveCategoryId));
      if (!mounted) return;
      setState(() => _recommendRecords = homeRecommend.records);
    } on UnauthorizedException {
      if (!mounted) return;
      await _handleUnauthorized();
    } catch (_) {
      if (!mounted) return;
      setState(() => _recommendListError = '加载推荐列表失败');
    } finally {
      if (!mounted) return;
      setState(() => _isLoadingRecommendList = false);
    }
  }

  Future<void> _handleUnauthorized() async {
    await AuthStorage.clearSession();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginPage()), (route) => false);
  }

  Future<void> _onCategoryTap(int index) async {
    setState(() => _selectedCategoryIndex = index);
    final selected = _categories[index];
    await _getRecommendList(
        categoryId: selected.id == 0 ? '' : selected.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildTopHeader(context)),
            SliverToBoxAdapter(child: _buildTabBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: List.generate(_homeTabs.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: index == _homeTabs.length - 1 ? 0 : 16),
                  child: _HeaderTabButton(label: _homeTabs[index],
                      selected: _selectedHomeTabIndex == index,
                      onTap: () =>
                          setState(() => _selectedHomeTabIndex = index)),
                );
              }),
            ),
          ),
          _CircleActionButton(icon: Icons.search_rounded, onTap: () {}),
          const SizedBox(width: 10),
          _CircleActionButton(icon: Icons.emoji_events_outlined, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildTabBody() {
    switch (_selectedHomeTabIndex) {
      case 0:
        return _buildRecommendSection();
      case 1:
        return _buildDispatchEntrySection();
      case 2:
        return _buildSimpleTabSection(title: '树洞',
            subtitle: '这里展示树洞内容',
            icon: Icons.forum_rounded);
      case 3:
        return _buildSimpleTabSection(title: '休闲玩',
            subtitle: '这里展示休闲玩法内容',
            icon: Icons.sports_esports_rounded);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildRecommendSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedCategory = _categories.isNotEmpty &&
        _selectedCategoryIndex < _categories.length
        ? _categories[_selectedCategoryIndex]
        : null;
    final selectedCategoryId = selectedCategory?.id == 0 ? '' : selectedCategory
        ?.id.toString() ?? '';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(13, 0, 13, 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3,
                  child: _BigBannerCard(
                      onTap: () {}, child: const SizedBox.shrink())),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _MiniActionCard(title: '接待大厅',
                        subtitle: '24H在线',
                        icon: Icons.groups_rounded,
                        gradient: const [Color(0xFFFFB36A), Color(0xFFFF7B7B)],
                        onTap: () {}),
                    const SizedBox(height: 10),
                    _MiniActionCard(title: '极速派单',
                        subtitle: '一起开黑',
                        icon: Icons.flash_on_rounded,
                        gradient: const [Color(0xFF6DC9FF), Color(0xFF7B61FF)],
                        onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildCategoryStrip(theme, colorScheme),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _FilterTag(label: '不限性别', selected: true),
              const SizedBox(width: 10),
              _FilterTag(label: '不限塔子水平'),
              const Spacer(),
              Text('筛选', style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600)),
              const SizedBox(width: 4),
              Icon(Icons.tune_rounded, size: 18,
                  color: colorScheme.onSurfaceVariant),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
            child: _recommendListContent(selectedCategoryId, selectedCategory)),
      ],
    );
  }

  Widget _recommendListContent(String selectedCategoryId,
      HomeCategoryItem? selectedCategory) {
    if (_isLoadingRecommendList) {
      return const Column(children: [
        _RecommendSkeletonCard(),
        SizedBox(height: 12),
        _RecommendSkeletonCard(),
        SizedBox(height: 12),
        _RecommendSkeletonCard()
      ]);
    }
    if (_recommendListError != null) {
      return _ErrorCard(message: _recommendListError!,
          onRetry: () => _getRecommendList(categoryId: selectedCategoryId));
    }
    if (_recommendRecords.isEmpty) return const _EmptyCard();
    return Column(
      children: List.generate(_recommendRecords.length, (index) {
        final record = _recommendRecords[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _TalentCard(
            record: record,
            highlight: selectedCategory?.id == 0,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                  PersonalDetailPage(
                      record: record, categoryId: record.categoryList[0].categoryId.toString())));
            },
          ),
        );
      }),
    );
  }

  Widget _buildDispatchEntrySection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 0, 13, 24),
      child: Column(
        children: [
          _BigBannerCard(onTap: () =>
              Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => const DispatchingCenterListPage())),
              child: const SizedBox.shrink()),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _MiniActionCard(title: '接待大厅',
                  subtitle: '24H在线',
                  icon: Icons.groups_rounded,
                  gradient: const [Color(0xFFFFB36A), Color(0xFFFF7B7B)],
                  onTap: () {})),
              const SizedBox(width: 10),
              Expanded(child: _MiniActionCard(title: '极速派单',
                  subtitle: '一起开黑',
                  icon: Icons.flash_on_rounded,
                  gradient: const [Color(0xFF6DC9FF), Color(0xFF7B61FF)],
                  onTap: () {})),
            ],
          ),
          const SizedBox(height: 14),
          const _DispatchPreviewList(),
        ],
      ),
    );
  }

  Widget _buildSimpleTabSection(
      {required String title, required String subtitle, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 16,
                  offset: const Offset(0, 8))
            ]),
        child: Row(children: [
          Container(width: 54,
              height: 54,
              decoration: const BoxDecoration(shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)])),
              child: Icon(icon, color: Colors.white)),
          const SizedBox(width: 14),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade600))
              ])
        ]),
      ),
    );
  }

  Widget _buildCategoryStrip(ThemeData theme, ColorScheme colorScheme) {
    if (_isLoadingCategories) {
      return SizedBox(height: 35,
          child: ListView.separated(scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (_, __) =>
                  Container(width: 76,
                  decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(18))),
              separatorBuilder: (_, __) => const SizedBox(width: 5),
              itemCount: 5));
    }
    if (_categoryError != null) {
      return Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(children: [
            Expanded(child: Text(_categoryError!,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.error, fontWeight: FontWeight.w600))),
            TextButton(onPressed: _loadCategories, child: const Text('重试'))
          ]));
    }
    return SizedBox(height: 38,
        child: ListView.separated(scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              final item = _categories[index];
              final isRecommend = index == 0;
              final isSelected = _selectedCategoryIndex == index;
              return _TopCategoryTab(
                  label: item.categoryName.isEmpty ? '分类${index + 1}' : item
                      .categoryName,
                  selected: isSelected,
                  isRecommend: isRecommend,
                  onTap: () => _onCategoryTap(index));
            },
            separatorBuilder: (_, __) => const SizedBox(width: 5),
            itemCount: _categories.length));
  }
}

class _HeaderTabButton extends StatelessWidget {
  const _HeaderTabButton(
      {required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(label, style: TextStyle(fontSize: 18,
          fontWeight: selected ? FontWeight.w900 : FontWeight.w700,
          color: selected ? const Color(0xFF111111) : const Color(0xFF8B8B8B))),
    );
  }
}

class _DispatchPreviewList extends StatelessWidget {
  const _DispatchPreviewList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 14,
                offset: const Offset(0, 6))
          ]),
      alignment: Alignment.center,
      child: const Text('派单厅内容预览', style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF555555))),
    );
  }
}

class _CircleActionButton extends StatelessWidget {
  const _CircleActionButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    return Material(color: colorScheme.surface,
        shape: const CircleBorder(),
        child: InkWell(customBorder: const CircleBorder(),
            onTap: onTap,
            child: Container(width: 38,
                height: 38,
                decoration: BoxDecoration(shape: BoxShape.circle,
                    border: Border.all(
                        color: colorScheme.outlineVariant.withValues(
                            alpha: 0.7))),
                child: Icon(icon, size: 20, color: colorScheme.onSurface))));
  }
}

class _BigBannerCard extends StatelessWidget {
  const _BigBannerCard({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.transparent,
        child: InkWell(onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: Container(height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]),
                    boxShadow: [
                      BoxShadow(color: const Color(0xFF7A5CFF).withValues(
                          alpha: 0.22),
                          blurRadius: 15,
                          offset: const Offset(0, 10))
                    ]),
                child: ClipRRect(borderRadius: BorderRadius.circular(24),
                    child: Stack(children: [
                      Positioned(right: -18,
                          top: -12,
                          child: Container(width: 92,
                              height: 92,
                              decoration: BoxDecoration(shape: BoxShape.circle,
                                  color: Colors.white.withValues(
                                      alpha: 0.12)))),
                      Positioned(left: 18,
                        top: 18,
                        child: Container(padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(999)),
                            child: const Text('热门活动', style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700))),),
                      const Positioned(left: 18,
                          top: 60,
                          child: Text('装扮夺宝', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              height: 1.05))),
                      const Positioned(left: 18,
                          bottom: 18,
                          child: Text('限时上新 · 赢限定装扮', style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500))),
                      Positioned(right: 16,
                          bottom: 14,
                          child: Container(width: 45,
                              height: 45,
                              decoration: BoxDecoration(shape: BoxShape.circle,
                                  color: Colors.white.withValues(alpha: 0.18)),
                              child: const Icon(Icons.card_giftcard_rounded,
                                  color: Colors.white, size: 25))),
                    ])))));
  }
}

class _MiniActionCard extends StatelessWidget {
  const _MiniActionCard(
      {required this.title, required this.subtitle, required this.icon, required this.gradient, required this.onTap});

  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    return Material(color: Colors.transparent,
        child: InkWell(onTap: onTap,
            borderRadius: BorderRadius.circular(15),
            child: Container(height: 70,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: colorScheme.surface,
                    border: Border.all(
                        color: colorScheme.outlineVariant.withValues(
                            alpha: 0.45))),
                child: Row(children: [
                  Container(width: 30,
                      height: 30,
                      decoration: BoxDecoration(shape: BoxShape.circle,
                          gradient: LinearGradient(colors: gradient)),
                      child: Icon(icon, color: Colors.white, size: 20)),
                  const SizedBox(width: 5),
                  Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title, style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                            fontSize: 11)),
                        const SizedBox(height: 5),
                        Text(subtitle, style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                            color: colorScheme.onSurfaceVariant, fontSize: 11))
                      ])),
                  Icon(Icons.chevron_right_rounded, color: colorScheme.outline)
                ]))));
  }
}

class _TopCategoryTab extends StatelessWidget {
  const _TopCategoryTab(
      {required this.label, this.selected = false, this.isRecommend = false, this.onTap});

  final String label;
  final bool selected;
  final bool isRecommend;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    final borderRadius = BorderRadius.circular(isRecommend ? 20 : 18);
    final child = AnimatedContainer(duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(
            horizontal: isRecommend ? 14 : 12, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: selected && isRecommend ? const LinearGradient(
                colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]) : null,
            color: selected && !isRecommend ? const Color(0xFF111111) : Colors
                .transparent,
            borderRadius: borderRadius,
            border: Border.all(color: isRecommend ? (selected
                ? Colors.transparent
                : const Color(0xFFDCCFFF)) : (selected
                ? Colors.transparent
                : colorScheme.outlineVariant.withValues(alpha: 0.45)),
                width: isRecommend ? 1.2 : 1),
            boxShadow: selected && isRecommend ? [
              BoxShadow(color: const Color(0xFF7A5CFF).withValues(alpha: 0.22),
                  blurRadius: 12,
                  offset: const Offset(0, 6))
            ] : null),
        child: Text(label, style: TextStyle(fontSize: 13,
            fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
            color: selected ? Colors.white : (isRecommend ? const Color(
                0xFF7A5CFF) : colorScheme.onSurfaceVariant))));
    if (onTap == null) return child;
    return Material(color: Colors.transparent,
        child: InkWell(borderRadius: borderRadius, onTap: onTap, child: child));
  }
}

class _FilterTag extends StatelessWidget {
  const _FilterTag({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
            color: selected ? const Color(0xFFF1ECFF) : colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: selected ? const Color(0xFFE3D8FF) : colorScheme
                    .outlineVariant.withValues(alpha: 0.55))),
        child: Text(label, style: TextStyle(
            color: selected ? const Color(0xFF7A5CFF) : colorScheme
                .onSurfaceVariant, fontWeight: FontWeight.w600, fontSize: 13)));
  }
}

class _TalentCard extends StatelessWidget {
  const _TalentCard({required this.record, required this.highlight, this.onTap});

  final HomeNewRecommendDataRecords record;
  final bool highlight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final price = record.orderAmount == 0 ? 600 : record.orderAmount;
    final name = record.nickName.isEmpty ? '匿名陪玩' : record.nickName;
    final categoryName = record.categoryList.isNotEmpty ? record.categoryList.first.categoryName : '推荐';
    final avatar = record.avatar;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: highlight ? const Color(0xFFE9DBFF) : colorScheme.outlineVariant.withValues(alpha: 0.45),
              width: highlight ? 1.2 : 1,
            ),
            boxShadow: highlight
                ? [BoxShadow(color: const Color(0xFF7A5CFF).withValues(alpha: 0.08), blurRadius: 18, offset: const Offset(0, 10))]
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: highlight ? const Color(0xFFF2E9FF) : const Color(0xFFF0F0F0),
                    backgroundImage: avatar.isNotEmpty ? NetworkImage(avatar) : null,
                    child: avatar.isEmpty
                        ? Icon(
                            highlight ? Icons.auto_awesome_rounded : Icons.person_rounded,
                            size: 28,
                            color: highlight ? const Color(0xFF7A5CFF) : colorScheme.onSurfaceVariant,
                          )
                        : null,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 2,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: highlight ? const Color(0xFFFFB84D) : const Color(0xFF35D07F),
                        border: const Border.fromBorderSide(BorderSide(color: Colors.white, width: 2)),
                      ),
                    ),
                  ),
                ],
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
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: colorScheme.onSurface,
                                ),
                          ),
                        ),
                        _LevelBadge(level: record.level == 0 ? (highlight ? 20 : 13) : record.level, highlight: highlight),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$categoryName ｜ 大神 ｜ 在线接单',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _MiniTag(label: highlight ? '推荐' : categoryName, highlighted: highlight),
                        _MiniTag(label: '响应快', highlighted: highlight),
                        if (highlight) const _MiniTag(label: '精选'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.play_circle_fill_rounded, color: const Color(0xFFB06BFF).withValues(alpha: 0.9), size: 18),
                        const SizedBox(width: 4),
                        Text('${record.accompanyLevel == 0 ? 8 : record.accompanyLevel}', style: TextStyle(color: colorScheme.onSurface, fontWeight: FontWeight.w600)),
                        const SizedBox(width: 12),
                        Icon(Icons.favorite_rounded, color: Colors.pink.shade300, size: 18),
                        const SizedBox(width: 4),
                        Text('${record.scoreAvg == 0 ? 95 : record.scoreAvg}%', style: TextStyle(color: colorScheme.onSurface, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('$price', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF8F7BFF))),
                  const SizedBox(height: 2),
                  const Text('钻/小时', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniTag extends StatelessWidget {
  const _MiniTag({required this.label, this.highlighted = false});

  final String label;
  final bool highlighted;

  @override
  Widget build(BuildContext context) =>
      Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: highlighted ? const Color(0xFFF1ECFF) : const Color(
              0xFFF3F4F7), borderRadius: BorderRadius.circular(999)),
      child: Text(label, style: TextStyle(fontSize: 11,
          fontWeight: FontWeight.w700,
          color: highlighted ? const Color(0xFF7A5CFF) : const Color(
              0xFF6F7480))));
}

class _LevelBadge extends StatelessWidget {
  const _LevelBadge({required this.level, this.highlight = false});

  final int level;
  final bool highlight;

  @override
  Widget build(BuildContext context) =>
      Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(gradient: highlight ? const LinearGradient(
          colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]) : null,
          color: highlight ? null : const Color(0xFFEAF3FF),
          borderRadius: BorderRadius.circular(999)),
      child: Text('Lv.$level', style: TextStyle(fontSize: 12,
          fontWeight: FontWeight.w700,
          color: highlight ? Colors.white : const Color(0xFF4A90E2))));
}

class _RecommendSkeletonCard extends StatelessWidget {
  const _RecommendSkeletonCard();

  @override
  Widget build(BuildContext context) =>
      Container(height: 136,
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.grey.shade300)),
      child: const SizedBox.shrink());
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) =>
      Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.red.shade200)),
      child: Row(children: [
        Expanded(child: Text(message)),
        TextButton(onPressed: onRetry, child: const Text('重试'))
      ]));
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard();

  @override
  Widget build(BuildContext context) =>
      Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.grey.shade300)),
      child: const Center(child: Text('暂无推荐数据')));
}
