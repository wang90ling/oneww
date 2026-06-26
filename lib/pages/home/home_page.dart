import 'package:flutter/material.dart';

import '../../core/helpers/app_logger.dart';
import '../../core/helpers/auth_storage.dart';
import '../../core/network/api_service.dart';
import '../../core/network/network_client.dart';
import '../../models/home_category_item.dart';
import '../../models/home_new_recommend_entity.dart';
import '../../models/play_room_response_entity.dart';
import '../../models/playroom_by_hot_request.dart';
import '../../models/query_dispatch_rooms_by_heat_request_entity.dart';
import '../../models/query_dispatch_rooms_by_heat_response_entity.dart';
import '../../models/recommend_request.dart';
import '../login/login_page.dart';
import 'personal_detail_page.dart';

/**
 * @author wangling
 * @date 2026/6/25 15:00
 * @description 主页内容展示
 */
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

  static const List<String> _homeTabs = <String>['点Ta', '派单厅', '树洞', '休闲玩'];
  int _selectedHomeTabIndex = 0;

  // 派单厅数据
  bool _isLoadingDispatchRooms = true;
  String? _dispatchRoomsError;
  List<QueryDispatchRoomsByHeatResponseDataRecords> _dispatchRooms = [];
  int _selectedDispatchRoomIndex = 0;

  // 树洞热门房间数据
  bool _isLoadingHotRooms = true;
  String? _hotRoomsError;
  List<PlayRoomResponseDataRecords> _hotRooms = [];
  int _selectedHotRoomIndex = 0;
  int _hotRoomsPageNo = 1;
  bool _hasMoreHotRooms = false;

  @override
  void initState() {
    super.initState();
    _checkAuthAndLoadData();
  }

  Future<void> _checkAuthAndLoadData() async {
    final hasToken = await AuthStorage.hasToken();
    AppLogger.info(
      'HomePage Token检查: ${hasToken ? "已登录" : "未登录"}',
      tag: 'wangling',
    );
    if (!hasToken) {
      if (!mounted) return;
      await Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
      return;
    }
    _loadCategories();
    _getRecommendList();
    _loadDispatchRooms();
    _loadHotRooms();
  }

  /// 加载派单厅数据
  Future<void> _loadDispatchRooms() async {
    setState(() {
      _isLoadingDispatchRooms = true;
      _dispatchRoomsError = null;
    });
    try {
      final req = QueryDispatchRoomsByHeatRequestEntity(pageNo: 1, pageSize: 20);
      final response = await _apiService.queryDispatchRoomsByHeat(req);
      final records = response.data?.records ?? const [];
      AppLogger.info('派单厅数据加载成功: ${records.length}条', tag: 'wangling');
      if (!mounted) return;
      setState(() {
        _dispatchRooms = records;
        _isLoadingDispatchRooms = false;
      });
    } on UnauthorizedException {
      if (!mounted) return;
      setState(() {
        _dispatchRoomsError = '加载派单厅失败，请重新登录';
        _isLoadingDispatchRooms = false;
      });
      await AuthStorage.clearSession();
      if (!mounted) return;
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    } catch (error) {
      AppLogger.error('加载派单厅失败', error: error, tag: 'wangling');
      if (!mounted) return;
      final errorMsg = error.toString();
      setState(() {
        _dispatchRoomsError = '加载派单厅失败\n$errorMsg';
        _isLoadingDispatchRooms = false;
      });
    }
  }

  /// 加载树洞热门房间数据
  Future<void> _loadHotRooms({bool refresh = false}) async {
    if (refresh) {
      _hotRoomsPageNo = 1;
    }
    setState(() {
      _isLoadingHotRooms = true;
      _hotRoomsError = null;
    });
    try {
      final req = PlayroomByHotRequest(pageNo: _hotRoomsPageNo, pageSize: 10);
      final response = await _apiService.getPlayRoomByHot(req);
      final records = response.data?.records ?? [];
      AppLogger.info('树洞热门房间数据加载成功: ${records.length}条', tag: 'wangling');
      if (!mounted) return;
      setState(() {
        if (refresh || _hotRoomsPageNo == 1) {
          _hotRooms = records;
        } else {
          _hotRooms = [..._hotRooms, ...records];
        }
        _hasMoreHotRooms = (response.data?.pageNo ?? 1) < (response.data?.pages ?? 1);
        _isLoadingHotRooms = false;
      });
    } on UnauthorizedException {
      if (!mounted) return;
      setState(() {
        _hotRoomsError = '加载树洞房间失败，请重新登录';
        _isLoadingHotRooms = false;
      });
    } catch (error) {
      AppLogger.error('加载树洞房间失败', error: error, tag: 'wangling');
      if (!mounted) return;
      setState(() {
        _hotRoomsError = '加载树洞房间失败\n${error.toString()}';
        _isLoadingHotRooms = false;
      });
    }
  }

  /// 加载更多树洞房间
  Future<void> _loadMoreHotRooms() async {
    if (_isLoadingHotRooms || !_hasMoreHotRooms) return;
    _hotRoomsPageNo++;
    await _loadHotRooms();
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
        _selectedCategoryIndex = mergedCategories.isEmpty
            ? 0
            : _selectedCategoryIndex.clamp(0, mergedCategories.length - 1);
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
    final effectiveCategoryId =
        categoryId ??
        (_categories.isNotEmpty
            ? _categories[_selectedCategoryIndex].id.toString()
            : '');
    setState(() {
      _isLoadingRecommendList = true;
      _recommendListError = null;
    });
    try {
      final homeRecommend = await _apiService.getRecommendList(
        RecommendRequest(
          pageNo: 1,
          pageSize: 20,
          categoryId: effectiveCategoryId,
        ),
      );
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
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  Future<void> _onCategoryTap(int index) async {
    setState(() => _selectedCategoryIndex = index);
    final selected = _categories[index];
    await _getRecommendList(
      categoryId: selected.id == 0 ? '' : selected.id.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (_selectedHomeTabIndex == 2 && 
                notification.metrics.pixels >= notification.metrics.maxScrollExtent - 200) {
              _loadMoreHotRooms();
            }
            return false;
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildTopHeader(context)),
              _buildTabBody(),
            ],
          ),
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
                    right: index == _homeTabs.length - 1 ? 0 : 16,
                  ),
                  child: _HeaderTabButton(
                    label: _homeTabs[index],
                    selected: _selectedHomeTabIndex == index,
                    onTap: () => setState(() => _selectedHomeTabIndex = index),
                  ),
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
        return SliverList(delegate: SliverChildListDelegate([_buildRecommendSection()]));
      case 1:
        return SliverList(delegate: SliverChildListDelegate([_buildDispatchEntrySection()]));
      case 2:
        return _buildHotRoomSliverSection();
      case 3:
        return SliverList(delegate: SliverChildListDelegate([
          _buildSimpleTabSection(
            title: '休闲玩',
            subtitle: '这里展示休闲玩法内容',
            icon: Icons.sports_esports_rounded,
          ),
        ]));
      default:
        return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
  }

  Widget _buildRecommendSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedCategory =
        _categories.isNotEmpty && _selectedCategoryIndex < _categories.length
        ? _categories[_selectedCategoryIndex]
        : null;
    final selectedCategoryId = selectedCategory?.id == 0
        ? ''
        : selectedCategory?.id.toString() ?? '';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(13, 0, 13, 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: _BigBannerCard(
                  onTap: () {},
                  child: const SizedBox.shrink(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _MiniActionCard(
                      title: '接待大厅',
                      subtitle: '24H在线',
                      icon: Icons.groups_rounded,
                      gradient: const [Color(0xFFFFB36A), Color(0xFFFF7B7B)],
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _MiniActionCard(
                      title: '极速派单',
                      subtitle: '一起开黑',
                      icon: Icons.flash_on_rounded,
                      gradient: const [Color(0xFF6DC9FF), Color(0xFF7B61FF)],
                      onTap: () {},
                    ),
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
              Text(
                '筛选',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.tune_rounded,
                size: 18,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
          child: _recommendListContent(selectedCategoryId, selectedCategory),
        ),
      ],
    );
  }

  Widget _recommendListContent(
    String selectedCategoryId,
    HomeCategoryItem? selectedCategory,
  ) {
    if (_isLoadingRecommendList) {
      return const Column(
        children: [
          _RecommendSkeletonCard(),
          SizedBox(height: 12),
          _RecommendSkeletonCard(),
          SizedBox(height: 12),
          _RecommendSkeletonCard(),
        ],
      );
    }
    if (_recommendListError != null) {
      return _ErrorCard(
        message: _recommendListError!,
        onRetry: () => _getRecommendList(categoryId: selectedCategoryId),
      );
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PersonalDetailPage(
                    record: record,
                    categoryId: record.categoryList[0].categoryId.toString(),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  Widget _buildDispatchEntrySection() {
    final bottomPadding = MediaQuery.of(context).padding.bottom + 96;
    
    // 加载中状态
    if (_isLoadingDispatchRooms) {
      return Column(
        children: [
          _DispatchSkeletonCard(),
          const SizedBox(height: 10),
          _DispatchSkeletonCard(),
          const SizedBox(height: 10),
          _DispatchSkeletonCard(),
          SizedBox(height: bottomPadding),
        ],
      );
    }
    
    // 错误状态
    if (_dispatchRoomsError != null) {
      return Column(
        children: [
          _DispatchErrorCard(
            message: _dispatchRoomsError!,
            onRetry: _loadDispatchRooms,
          ),
          SizedBox(height: bottomPadding),
        ],
      );
    }
    
    // 空数据状态
    if (_dispatchRooms.isEmpty) {
      return Column(
        children: [
          _DispatchEmptyCard(),
          SizedBox(height: bottomPadding),
        ],
      );
    }
    
    // 正常数据展示
    return Column(
      children: [
        _TopHeroGrid(rooms: _dispatchRooms.take(3).toList()),
        const SizedBox(height: 16),
        ...List.generate(_dispatchRooms.length - 3, (index) {
          final room = _dispatchRooms[index + 3];
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _DispatchRoomCard(
              room: room,
              selected: _selectedDispatchRoomIndex == index + 3,
              onTap: () =>
                  setState(() => _selectedDispatchRoomIndex = index + 3),
            ),
          );
        }),
        SizedBox(height: bottomPadding),
      ],
    );
  }

  /// 树洞热门房间区域 - Sliver版本
  Widget _buildHotRoomSliverSection() {
    return SliverList(
      delegate: SliverChildListDelegate([
        // 树洞标题栏
        _buildHotRoomHeader(),
        const SizedBox(height: 14),
        // 分类标签栏
        _buildHotRoomCategoryBar(),
        const SizedBox(height: 16),
        // 内容区域
        _buildHotRoomContent(),
      ]),
    );
  }

  /// 树洞热门房间区域
  Widget _buildHotRoomSection() {
    return Column(
      children: [
        // 树洞标题栏
        _buildHotRoomHeader(),
        const SizedBox(height: 14),
        // 分类标签栏
        _buildHotRoomCategoryBar(),
        const SizedBox(height: 16),
        // 内容区域
        Expanded(
          child: _buildHotRoomContent(),
        ),
      ],
    );
  }

  Widget _buildHotRoomHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '树洞',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '发现正在热聊的房间',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.88),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(Icons.search_rounded, color: Color(0xFF1A1A1A)),
          ),
        ],
      ),
    );
  }

  Widget _buildHotRoomCategoryBar() {
    final categories = ['热门', '小圈', '点唱', '情感', '交友', '电台'];
    return SizedBox(
      height: 32,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final selected = index == 0;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              gradient: selected
                  ? const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)])
                  : null,
              color: selected ? null : Colors.white.withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFF666666),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: categories.length,
      ),
    );
  }

  Widget _buildHotRoomContent() {
    final bottomPadding = MediaQuery.of(context).padding.bottom + 96;

    // 加载中状态
    if (_isLoadingHotRooms && _hotRooms.isEmpty) {
      return _buildHotRoomSkeleton();
    }

    // 错误状态
    if (_hotRoomsError != null && _hotRooms.isEmpty) {
      return SizedBox(
        height: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_hotRoomsError!, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _loadHotRooms(refresh: true),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      );
    }

    // 空数据状态
    if (_hotRooms.isEmpty) {
      return SizedBox(
        height: 300,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.forum_outlined, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('暂无热门房间'),
              SizedBox(height: 8),
              Text('下拉刷新试试', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    }

    // 正常数据展示
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(16, 0, 16, bottomPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemCount: _hotRooms.length + (_hasMoreHotRooms ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= _hotRooms.length) {
          return const Center(child: CircularProgressIndicator());
        }
        return _HotRoomCard(
          room: _hotRooms[index],
          selected: _selectedHotRoomIndex == index,
          onTap: () => setState(() => _selectedHotRoomIndex = index),
        );
      },
    );
  }

  Widget _buildHotRoomSkeleton() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 96),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => _HotRoomSkeletonCard(),
    );
  }

  Widget _buildSimpleTabSection({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)],
                ),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryStrip(ThemeData theme, ColorScheme colorScheme) {
    if (_isLoadingCategories) {
      return SizedBox(
        height: 35,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (_, __) => Container(
            width: 76,
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          separatorBuilder: (_, __) => const SizedBox(width: 5),
          itemCount: 5,
        ),
      );
    }
    if (_categoryError != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _categoryError!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(onPressed: _loadCategories, child: const Text('重试')),
          ],
        ),
      );
    }
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          final item = _categories[index];
          final isRecommend = index == 0;
          final isSelected = _selectedCategoryIndex == index;
          return _TopCategoryTab(
            label: item.categoryName.isEmpty
                ? '分类${index + 1}'
                : item.categoryName,
            selected: isSelected,
            isRecommend: isRecommend,
            onTap: () => _onCategoryTap(index),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 5),
        itemCount: _categories.length,
      ),
    );
  }
}

class _HeaderTabButton extends StatelessWidget {
  const _HeaderTabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: selected ? FontWeight.w900 : FontWeight.w700,
          color: selected ? const Color(0xFF111111) : const Color(0xFF8B8B8B),
        ),
      ),
    );
  }
}

class _CircleActionButton extends StatelessWidget {
  const _CircleActionButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.surface,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.7),
            ),
          ),
          child: Icon(icon, size: 20, color: colorScheme.onSurface),
        ),
      ),
    );
  }
}

class _BigBannerCard extends StatelessWidget {
  const _BigBannerCard({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF7A5CFF).withValues(alpha: 0.22),
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                Positioned(
                  right: -18,
                  top: -12,
                  child: Container(
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  top: 18,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text(
                      '热门活动',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 18,
                  top: 60,
                  child: Text(
                    '装扮夺宝',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      height: 1.05,
                    ),
                  ),
                ),
                const Positioned(
                  left: 18,
                  bottom: 18,
                  child: Text(
                    '限时上新 · 赢限定装扮',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 14,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.18),
                    ),
                    child: const Icon(
                      Icons.card_giftcard_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MiniActionCard extends StatelessWidget {
  const _MiniActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colorScheme.surface,
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.45),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: gradient),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: colorScheme.outline),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopCategoryTab extends StatelessWidget {
  const _TopCategoryTab({
    required this.label,
    this.selected = false,
    this.isRecommend = false,
    this.onTap,
  });

  final String label;
  final bool selected;
  final bool isRecommend;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderRadius = BorderRadius.circular(isRecommend ? 20 : 18);
    final child = AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: EdgeInsets.symmetric(
        horizontal: isRecommend ? 14 : 12,
        vertical: 8,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: selected && isRecommend
            ? const LinearGradient(
                colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)],
              )
            : null,
        color: selected && !isRecommend
            ? const Color(0xFF111111)
            : Colors.transparent,
        borderRadius: borderRadius,
        border: Border.all(
          color: isRecommend
              ? (selected ? Colors.transparent : const Color(0xFFDCCFFF))
              : (selected
                    ? Colors.transparent
                    : colorScheme.outlineVariant.withValues(alpha: 0.45)),
          width: isRecommend ? 1.2 : 1,
        ),
        boxShadow: selected && isRecommend
            ? [
                BoxShadow(
                  color: const Color(0xFF7A5CFF).withValues(alpha: 0.22),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
          color: selected
              ? Colors.white
              : (isRecommend
                    ? const Color(0xFF7A5CFF)
                    : colorScheme.onSurfaceVariant),
        ),
      ),
    );
    if (onTap == null) return child;
    return Material(
      color: Colors.transparent,
      child: InkWell(borderRadius: borderRadius, onTap: onTap, child: child),
    );
  }
}

class _FilterTag extends StatelessWidget {
  const _FilterTag({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFF1ECFF) : colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected
              ? const Color(0xFFE3D8FF)
              : colorScheme.outlineVariant.withValues(alpha: 0.55),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected
              ? const Color(0xFF7A5CFF)
              : colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _TalentCard extends StatelessWidget {
  const _TalentCard({
    required this.record,
    required this.highlight,
    this.onTap,
  });

  final HomeNewRecommendDataRecords record;
  final bool highlight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final price = record.orderAmount == 0 ? 600 : record.orderAmount;
    final name = record.nickName.isEmpty ? '匿名陪玩' : record.nickName;
    final categoryName = record.categoryList.isNotEmpty
        ? record.categoryList.first.categoryName
        : '推荐';
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
              color: highlight
                  ? const Color(0xFFE9DBFF)
                  : colorScheme.outlineVariant.withValues(alpha: 0.45),
              width: highlight ? 1.2 : 1,
            ),
            boxShadow: highlight
                ? [
                    BoxShadow(
                      color: const Color(0xFF7A5CFF).withValues(alpha: 0.08),
                      blurRadius: 18,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: highlight
                        ? const Color(0xFFF2E9FF)
                        : const Color(0xFFF0F0F0),
                    backgroundImage: avatar.isNotEmpty
                        ? NetworkImage(avatar)
                        : null,
                    child: avatar.isEmpty
                        ? Icon(
                            highlight
                                ? Icons.auto_awesome_rounded
                                : Icons.person_rounded,
                            size: 28,
                            color: highlight
                                ? const Color(0xFF7A5CFF)
                                : colorScheme.onSurfaceVariant,
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
                        color: highlight
                            ? const Color(0xFFFFB84D)
                            : const Color(0xFF35D07F),
                        border: const Border.fromBorderSide(
                          BorderSide(color: Colors.white, width: 2),
                        ),
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
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: colorScheme.onSurface,
                                ),
                          ),
                        ),
                        _LevelBadge(
                          level: record.level == 0
                              ? (highlight ? 20 : 13)
                              : record.level,
                          highlight: highlight,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$categoryName ｜ 大神 ｜ 在线接单',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _MiniTag(
                          label: highlight ? '推荐' : categoryName,
                          highlighted: highlight,
                        ),
                        _MiniTag(label: '响应快', highlighted: highlight),
                        if (highlight) const _MiniTag(label: '精选'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.play_circle_fill_rounded,
                          color: const Color(0xFFB06BFF).withValues(alpha: 0.9),
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${record.accompanyLevel == 0 ? 8 : record.accompanyLevel}',
                          style: TextStyle(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.favorite_rounded,
                          color: Colors.pink.shade300,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${record.scoreAvg == 0 ? 95 : record.scoreAvg}%',
                          style: TextStyle(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$price',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF8F7BFF),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '钻/小时',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
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
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: highlighted ? const Color(0xFFF1ECFF) : const Color(0xFFF3F4F7),
      borderRadius: BorderRadius.circular(999),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: highlighted ? const Color(0xFF7A5CFF) : const Color(0xFF6F7480),
      ),
    ),
  );
}

class _LevelBadge extends StatelessWidget {
  const _LevelBadge({required this.level, this.highlight = false});

  final int level;
  final bool highlight;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      gradient: highlight
          ? const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)])
          : null,
      color: highlight ? null : const Color(0xFFEAF3FF),
      borderRadius: BorderRadius.circular(999),
    ),
    child: Text(
      'Lv.$level',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: highlight ? Colors.white : const Color(0xFF4A90E2),
      ),
    ),
  );
}

class _RecommendSkeletonCard extends StatelessWidget {
  const _RecommendSkeletonCard();

  @override
  Widget build(BuildContext context) => Container(
    height: 136,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: const SizedBox.shrink(),
  );
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Colors.red.shade200),
    ),
    child: Row(
      children: [
        Expanded(child: Text(message)),
        TextButton(onPressed: onRetry, child: const Text('重试')),
      ],
    ),
  );
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: const Center(child: Text('暂无推荐数据')),
  );
}

class _ImageUrlHelper {
  /// 验证URL是否为有效的图片格式
  static bool isValidImageUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    
    // 图片扩展名白名单
    const validExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.bmp'];
    final lowerUrl = url.toLowerCase();
    
    return validExtensions.any((ext) => lowerUrl.endsWith(ext));
  }
  
  /// 获取安全的图片URL，如果无效则返回null
  static String? getSafeImageUrl(String? url) {
    if (isValidImageUrl(url)) {
      return url;
    }
    return null;
  }
}

class _TopHeroGrid extends StatelessWidget {
  const _TopHeroGrid({required this.rooms});

  final List<QueryDispatchRoomsByHeatResponseDataRecords> rooms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (int i = 0; i < rooms.length; i++) ...[
            Expanded(child: _TopHeroCard(room: rooms[i], rank: i + 1)),
            if (i != rooms.length - 1) const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}

class _TopHeroCard extends StatelessWidget {
  const _TopHeroCard({required this.room, required this.rank});

  final QueryDispatchRoomsByHeatResponseDataRecords room;
  final int rank;

  @override
  Widget build(BuildContext context) {
    // 从房间数据中提取信息
    final roomName = room.roomName.isNotEmpty ? room.roomName : '派单厅${room.roomNo}';
    final coverUrl = _ImageUrlHelper.getSafeImageUrl(room.roomAvatar);
    final hostName = room.preside.nickName.isNotEmpty ? room.preside.nickName : '暂无主持~';
    final heatValue = room.heatValue.toString();
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBDA8FF).withValues(alpha: 0.16),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 0.82,
                  child: coverUrl != null
                      ? Image.network(
                          coverUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _fallbackCover(rank),
                        )
                      : _fallbackCover(rank),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: _RankBadge(rank: rank),
              ),
              Positioned(
                right: 8,
                bottom: 8,
                child: _HeatBadge(text: heatValue),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              _SmallTag(text: '派单'),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  roomName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF222222),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.person_rounded,
                size: 16,
                color: Color(0xFFBEBEBE),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  hostName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9A9A9A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fallbackCover(int rank) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2F2B3F), Color(0xFF6B5AED)],
        ),
      ),
      child: Center(
        child: Icon(
          rank == 1 ? Icons.phone_iphone_rounded : Icons.image_rounded,
          color: Colors.white.withValues(alpha: 0.75),
          size: 36,
        ),
      ),
    );
  }
}

class _RankBadge extends StatelessWidget {
  const _RankBadge({required this.rank});

  final int rank;

  @override
  Widget build(BuildContext context) {
    final colors = switch (rank) {
      1 => const [Color(0xFFFFD66B), Color(0xFFFFB34D)],
      2 => const [Color(0xFFDBE4FF), Color(0xFFA9B7FF)],
      3 => const [Color(0xFFFFD9B0), Color(0xFFFFB46B)],
      _ => const [Color(0xFFEDE3FF), Color(0xFFCDB8FF)],
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TOP',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          Text(
            '$rank',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeatBadge extends StatelessWidget {
  const _HeatBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEFEF).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_fire_department_rounded,
            color: Color(0xFFFF5A6A),
            size: 14,
          ),
          const SizedBox(width: 2),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: Color(0xFFFF5A6A),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallTag extends StatelessWidget {
  const _SmallTag({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EFFF),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Color(0xFF7A5CFF),
        ),
      ),
    );
  }
}

class _DispatchRoomCard extends StatelessWidget {
  const _DispatchRoomCard({
    required this.room,
    required this.selected,
    required this.onTap,
  });

  final QueryDispatchRoomsByHeatResponseDataRecords room;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // 从房间数据中提取信息
    final roomName = room.roomName.isNotEmpty ? room.roomName : '派单厅${room.roomNo}';
    final coverUrl = _ImageUrlHelper.getSafeImageUrl(room.roomAvatar);
    final hostName = room.preside.nickName.isNotEmpty ? room.preside.nickName : '暂无主持~';
    final heatValue = room.heatValue.toString();
    final isLocked = room.passwordSettings == 1;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 132,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.94),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFBFA8FF).withValues(alpha: 0.12),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
            border: Border.all(
              color: selected
                  ? const Color(0xFFE3CFFF)
                  : const Color(0xFFF2ECFF),
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      width: 108,
                      height: 108,
                      child: coverUrl != null
                          ? Image.network(
                              coverUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) => Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Color(0xFFCBB8FF), Color(0xFFF1D2F2)],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.image_rounded,
                                  color: Colors.white70,
                                  size: 34,
                                ),
                              ),
                            )
                          : Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xFFCBB8FF), Color(0xFFF1D2F2)],
                                ),
                              ),
                              child: const Icon(
                                Icons.image_rounded,
                                color: Colors.white70,
                                size: 34,
                              ),
                            ),
                    ),
                  ),
                  Positioned(left: 8, top: 8, child: _SmallTag(text: '派单')),
                  if (isLocked)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.lock_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              roomName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF222222),
                                height: 1.1,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          _HeatBadge(text: heatValue),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Icon(
                            Icons.person_rounded,
                            size: 18,
                            color: Color(0xFFD2D2D2),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            hostName,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFFB2B2B2),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 派单厅骨架屏组件
class _DispatchSkeletonCard extends StatelessWidget {
  const _DispatchSkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 132,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

// 派单厅错误卡片
class _DispatchErrorCard extends StatelessWidget {
  const _DispatchErrorCard({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red.shade200),
        ),
        child: Row(
          children: [
            Expanded(child: Text(message)),
            TextButton(onPressed: onRetry, child: const Text('重试')),
          ],
        ),
      ),
    );
  }
}

// 派单厅空数据卡片
class _DispatchEmptyCard extends StatelessWidget {
  const _DispatchEmptyCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Center(
          child: Column(
            children: [
              Icon(Icons.meeting_room_outlined, size: 48, color: Colors.grey),
              SizedBox(height: 12),
              Text('暂无派单厅数据'),
            ],
          ),
        ),
      ),
    );
  }
}

/// 树洞热门房间卡片
class _HotRoomCard extends StatelessWidget {
  const _HotRoomCard({
    required this.room,
    required this.selected,
    required this.onTap,
  });

  final PlayRoomResponseDataRecords room;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = (room.roomName ?? room.moduleName ?? '未命名房间').trim();
    final subtitle = (room.mainLabel ?? '').trim();
    
    // 获取图片URL，参考 room_live_list_page.dart 的逻辑
    String image = '';
    if (_isValidImageUrl(room.roomAvatar ?? '')) {
      image = room.roomAvatar!;
    } else if (room.wallpaperPropInfo?.dynamicEffect != null && 
               _isValidImageUrl(room.wallpaperPropInfo!.dynamicEffect!)) {
      image = room.wallpaperPropInfo!.dynamicEffect!;
    } else if (room.defaultWallpaperPropInfo?.dynamicEffect != null && 
               _isValidImageUrl(room.defaultWallpaperPropInfo!.dynamicEffect!)) {
      image = room.defaultWallpaperPropInfo!.dynamicEffect!;
    }

    if (image.isEmpty) {
      image = _getDefaultImage();
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => _buildDefaultCover(),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return _buildDefaultCover();
                  },
                ),
              ),
              // 渐变遮罩
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.08),
                        Colors.black.withValues(alpha: 0.18),
                        Colors.black.withValues(alpha: 0.72),
                      ],
                      stops: const [0.0, 0.6, 1.0],
                    ),
                  ),
                ),
              ),
              // 标签行
              Positioned(
                left: 10,
                top: 10,
                right: 10,
                child: Row(
                  children: [
                    _HotRoomPill(
                      text: subtitle.isNotEmpty ? subtitle : '热门',
                      gradient: const LinearGradient(colors: [Color(0xFFFF7BC1), Color(0xFFFF5B7A)]),
                    ),
                    const Spacer(),
                    _HotRoomPill(
                      text: _formatCount(room.heatValue ?? 0),
                      gradient: const LinearGradient(colors: [Color(0xFF8E7BFF), Color(0xFF5A7BFF)]),
                    ),
                  ],
                ),
              ),
              // 锁定图标
              if (room.openStatus == 1)
                Positioned(
                  right: 10,
                  top: 44,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.lock_rounded, size: 18, color: Color(0xFF7A5CFF)),
                  ),
                ),
              // 房间名称
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 10000) {
      final value = count / 10000;
      return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}w';
    }
    return '$count';
  }

  bool _isValidImageUrl(String url) {
    if (url.isEmpty) return false;
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      return false;
    }
    // 排除非图片URL
    if (url.contains('account.xiaomi.com') || 
        url.contains('passport') || 
        url.contains('login') ||
        url.contains('.html') ||
        url.contains('.php') ||
        url.contains('.asp')) {
      return false;
    }
    final imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.bmp', '.svg'];
    return imageExtensions.any((ext) => url.toLowerCase().contains(ext));
  }

  String _getDefaultImage() {
    const images = [
      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?auto=format&fit=crop&w=900&q=80',
      'https://images.unsplash.com/photo-1493246507139-91e8fad9978e?auto=format&fit=crop&w=900&q=80',
      'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?auto=format&fit=crop&w=900&q=80',
    ];
    return images[DateTime.now().millisecondsSinceEpoch % images.length];
  }

  Widget _buildDefaultCover() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
        ),
      ),
      child: const Center(
        child: Icon(Icons.home_filled, size: 48, color: Colors.white38),
      ),
    );
  }
}

/// 树洞房间标签
class _HotRoomPill extends StatelessWidget {
  const _HotRoomPill({required this.text, required this.gradient});

  final String text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// 树洞房间骨架屏卡片
class _HotRoomSkeletonCard extends StatelessWidget {
  const _HotRoomSkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.grey.shade200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 14,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 10,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
