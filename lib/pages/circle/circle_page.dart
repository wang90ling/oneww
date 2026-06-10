import 'package:flutter/material.dart';

import '../../core/helpers/app_logger.dart';
import '../../core/network/api_service.dart';
import '../../models/new_circle_request.dart';
import '../../models/post_list_response_entity.dart';

/// 圈子页面
class CirclePage extends StatefulWidget {
  const CirclePage({super.key});

  @override
  State<CirclePage> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  final ApiService _apiService = ApiService();
  final ScrollController _scrollController = ScrollController();

  int _selectedTabIndex = 1;
  bool _isPublishing = false;

  bool _isLoadingNewCircleList = true;
  String? _newCircleListError;
  List<PostListResponseData> _newCircles = const [];

  @override
  void initState() {
    super.initState();
    _getNewCircleList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _getNewCircleList() async {
    setState(() {
      _isLoadingNewCircleList = true;
      _newCircleListError = null;
    });

    try {
      final response = await _apiService.getNewPostList(
        const NewCircleRequest(
          pageNo: 1,
          pageSize: 20,
          endTime: '',
          postId: '',
        ),
      );

      AppLogger.info('newPostResponse: ${response.data}', tag: 'wangling');

      if (!mounted) return;
      setState(() {
        _newCircles = response.data ?? <PostListResponseData>[];
      });
    } catch (error) {
      AppLogger.error(
        '加载最新圈子失败',
        error: error,
        tag: 'CirclePage',
      );
      if (!mounted) return;
      setState(() {
        _newCircleListError = '加载最新圈子失败';
      });
    } finally {
      if (!mounted) return;
      setState(() {
        _isLoadingNewCircleList = false;
      });
    }
  }

  Future<void> _openPublishSheet() async {
    final result = await showModalBottomSheet<_PublishResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _PublishSheet(),
    );

    if (!mounted || result == null) return;

    setState(() => _isPublishing = true);
    await Future<void>.delayed(const Duration(milliseconds: 600));

    if (!mounted) return;

    setState(() {
      _isPublishing = false;
    });

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(const SnackBar(content: Text('动态发布成功')));
  }

  void _toggleLike(int index) {
    setState(() {
      final post = _newCircles[index];
      final liked = (post.likedFlag ?? 0) == 1;

      post.likedFlag = liked ? 0 : 1;
      final count = post.likesCount ?? 0;
      post.likesCount = liked ? (count > 0 ? count - 1 : 0) : count + 1;
    });
  }

  void _openComments(PostListResponseData post) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _CommentSheet(post: post),
    );
  }

  void _sharePost(PostListResponseData post) {
    setState(() {
      post.shareCount = (post.shareCount ?? 0) + 1;
    });

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(content: Text('已分享「${post.userInfo?.nickName ?? '这条动态'}」')),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: _buildTopTabs(theme)),
                const SliverToBoxAdapter(child: SizedBox(height: 12)),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF4F0FF), Color(0xFFFFF2FB)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.auto_awesome_rounded,
                              color: Color(0xFF7A5CFF),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '发现圈友的精彩瞬间',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '图文 / 视频 / 纯文字动态都可以发布',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
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

                const SliverToBoxAdapter(child: SizedBox(height: 12)),

                if (_isLoadingNewCircleList && _newCircles.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (_newCircleListError != null && _newCircles.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _newCircleListError ?? '加载失败',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: _getNewCircleList,
                              child: const Text('重试'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else if (_newCircles.isEmpty)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: Text('暂无动态')),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
                      sliver: SliverList.separated(
                        itemCount: _newCircles.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 14),
                        itemBuilder: (context, index) {
                          final post = _newCircles[index];
                          return _CirclePostCard(
                            post: post,
                            onShare: () => _sharePost(post),
                            onLike: () => _toggleLike(index),
                            onComment: () => _openComments(post),
                          );
                        },
                      ),
                    ),

                const SliverToBoxAdapter(child: SizedBox(height: 90)),
              ],
            ),

            Positioned(
              right: 16,
              bottom: 24,
              child: AnimatedScale(
                scale: _isPublishing ? 0.95 : 1,
                duration: const Duration(milliseconds: 180),
                child: _PublishFloatingButton(
                  onTap: _openPublishSheet,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopTabs(ThemeData theme) {
    final tabs = ['关注', '最新', '最热'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ...List.generate(tabs.length, (index) {
            final selected = _selectedTabIndex == index;
            return Padding(
              padding: EdgeInsets.only(right: index == tabs.length - 1 ? 0 : 24),
              child: GestureDetector(
                onTap: () => setState(() => _selectedTabIndex = index),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 180),
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: selected ? FontWeight.w900 : FontWeight.w600,
                    color: selected ? const Color(0xFF111111) : Colors.grey.shade600,
                  ),
                  child: Text(tabs[index]),
                ),
              ),
            );
          }),
          const Spacer(),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.search_rounded),
          ),
        ],
      ),
    );
  }
}

class _CirclePostCard extends StatelessWidget {
  const _CirclePostCard({
    required this.post,
    required this.onShare,
    required this.onLike,
    required this.onComment,
  });

  final PostListResponseData post;
  final VoidCallback onShare;
  final VoidCallback onLike;
  final VoidCallback onComment;

  bool get _isVideoPost {
    final mediaType = post.mediaType ?? 0;
    final postType = post.postType ?? 0;
    return mediaType == 2 || postType == 2 || postType == 3;
  }

  List<_MediaPreview> get _medias {
    final result = <_MediaPreview>[];

    final details = post.fileDetails ?? <PostListResponseDataFileDetails>[];
    for (final item in details) {
      final fileUrl = (item.fileUrl ?? '').trim();
      final coverUrl = (item.firstSnapshot ?? '').trim();

      final displayUrl = _isVideoPost
          ? (coverUrl.isNotEmpty ? coverUrl : fileUrl)
          : (fileUrl.isNotEmpty ? fileUrl : coverUrl);

      if (displayUrl.isNotEmpty) {
        result.add(
          _MediaPreview(
            url: displayUrl,
            isVideo: _isVideoPost,
          ),
        );
      }
    }

    if (result.isEmpty) {
      for (final url in post.files ?? const <String>[]) {
        final clean = url.trim();
        if (clean.isNotEmpty) {
          result.add(_MediaPreview(url: clean, isVideo: _isVideoPost));
        }
      }
    }

    return result;
  }

  String _formatCount(int? value, String emptyText) {
    final count = value ?? 0;
    if (count <= 0) return emptyText;
    if (count >= 10000) {
      return '${(count / 10000).toStringAsFixed(count % 10000 == 0 ? 0 : 1)}w';
    }
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(count % 1000 == 0 ? 0 : 1)}k';
    }
    return '$count';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final nickName = (post.userInfo?.nickName ?? '匿名用户').trim();
    final avatarUrl = (post.userInfo?.avatar ?? post.userInfo?.moduleAvatar ?? '').trim();
    final timeText = (post.createTime ?? '').trim();
    final content = (post.content ?? '').trim();
    final location = (post.location ?? '').trim();
    final liked = (post.likedFlag ?? 0) == 1;

    final tags = <String>[
      ...?post.subjects
          ?.map((e) => e.name ?? '')
          .where((e) => e.trim().isNotEmpty)
          .map((e) => '#$e'),
      if (location.isNotEmpty) '#$location',
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _PostAvatar(url: avatarUrl),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            nickName,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: colorScheme.onSurface,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if ((post.topFlag ?? 0) == 1) ...[
                          const SizedBox(width: 6),
                          _Badge(
                            text: '置顶',
                            colors: const [Color(0xFF5A7BFF), Color(0xFFEF6AD7)],
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      timeText.isNotEmpty ? timeText : '刚刚',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (location.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              location,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.more_vert_rounded, color: colorScheme.onSurfaceVariant),
            ],
          ),

          if (content.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              content,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.45,
                color: colorScheme.onSurface,
              ),
            ),
          ],

          if (tags.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags
                  .map(
                    (e) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FF),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: Color(0xFF5A7BFF),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],

          if (_medias.isNotEmpty) ...[
            const SizedBox(height: 12),
            _MediaGrid(media: _medias),
          ],

          const SizedBox(height: 12),

          Row(
            children: [
              _ActionButton(
                icon: liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                label: _formatCount(post.likesCount, '喜欢'),
                onTap: onLike,
                iconColor: liked ? const Color(0xFFFF5B7A) : null,
              ),
              const Spacer(),
              _ActionButton(
                icon: Icons.mode_comment_outlined,
                label: _formatCount(post.commentCount, '评论'),
                onTap: onComment,
              ),
              const Spacer(),
              _ActionButton(
                icon: Icons.share_outlined,
                label: _formatCount(post.shareCount, '分享'),
                onTap: onShare,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PostAvatar extends StatelessWidget {
  const _PostAvatar({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 44,
        height: 44,
        child: url.isNotEmpty
            ? Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: const Color(0xFFF1F3F8),
            child: const Icon(Icons.person_rounded, color: Color(0xFF8E8E8E)),
          ),
        )
            : Container(
          color: const Color(0xFFF1F3F8),
          child: const Icon(Icons.person_rounded, color: Color(0xFF8E8E8E)),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.text,
    required this.colors,
  });

  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _MediaPreview {
  const _MediaPreview({
    required this.url,
    required this.isVideo,
  });

  final String url;
  final bool isVideo;
}

class _MediaGrid extends StatelessWidget {
  const _MediaGrid({required this.media});

  final List<_MediaPreview> media;

  @override
  Widget build(BuildContext context) {
    if (media.isEmpty) return const SizedBox.shrink();

    if (media.length == 1) {
      final item = media.first;
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: item.isVideo ? 16 / 10 : 1.12,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                item.url,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFFF2F3F7),
                  child: const Center(child: Icon(Icons.broken_image_outlined)),
                ),
              ),
              if (item.isVideo)
                Container(
                  color: Colors.black.withValues(alpha: 0.18),
                  child: const Center(
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white70,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 34,
                        color: Color(0xFF7A5CFF),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    final showCount = media.length > 4 ? 4 : media.length;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: showCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = media[index];
        final showMore = index == 3 && media.length > 4;

        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                item.url,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFFF2F3F7),
                  child: const Center(child: Icon(Icons.broken_image_outlined)),
                ),
              ),
              if (item.isVideo)
                Container(
                  color: Colors.black.withValues(alpha: 0.18),
                  child: const Center(
                    child: Icon(
                      Icons.play_circle_fill_rounded,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              if (showMore)
                Container(
                  color: Colors.black.withValues(alpha: 0.45),
                  child: Center(
                    child: Text(
                      '+${media.length - 4}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 22, color: iconColor ?? colorScheme.onSurface),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PublishFloatingButton extends StatelessWidget {
  const _PublishFloatingButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x337A5CFF),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(Icons.add_rounded, color: Colors.white, size: 34),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF7A5CFF),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            '发动态',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _CommentSheet extends StatelessWidget {
  const _CommentSheet({required this.post});

  final PostListResponseData post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final latestComment = (post.comment?.content ?? '').trim();

    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 16 + bottomInset),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 42,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                '评论 · ${post.commentCount ?? 0}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (latestComment.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FC),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                latestComment,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  child: Icon(Icons.person_rounded),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '写下你的评论...',
                      border: InputBorder.none,
                      isDense: true,
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('发送')),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text('这里可以接入真实评论列表。当前已按接口结构展示。'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PublishSheet extends StatefulWidget {
  const _PublishSheet();

  @override
  State<_PublishSheet> createState() => _PublishSheetState();
}

class _PublishSheetState extends State<_PublishSheet> {
  final TextEditingController _contentController = TextEditingController();
  final List<String> _mediaUrls = [];
  _PostType _type = _PostType.text;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  void _addDemoMedia() {
    setState(() {
      if (_type == _PostType.video) {
        _mediaUrls
          ..clear()
          ..add(
            'https://images.unsplash.com/photo-1542751110-97427bbecf20?auto=format&fit=crop&w=900&q=80',
          );
      } else {
        _mediaUrls.addAll([
          'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80',
          'https://images.unsplash.com/photo-1509395176047-4a66953fd231?auto=format&fit=crop&w=900&q=80',
        ]);
      }
    });
  }

  void _submit() {
    final content = _contentController.text.trim();
    if (content.isEmpty && _mediaUrls.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请先输入内容或上传图片/视频')),
      );
      return;
    }

    Navigator.pop(
      context,
      _PublishResult(
        content: content,
        type: _type,
        mediaUrls: List<String>.from(_mediaUrls),
        tags: const ['# 发动态'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 16 + bottomInset),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('取消'),
                ),
                const Spacer(),
                Text(
                  '发高光',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: _submit,
                  child: const Text('发布'),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _TypeChip(
                        label: '纯文字',
                        selected: _type == _PostType.text,
                        onTap: () => setState(() => _type = _PostType.text),
                      ),
                      const SizedBox(width: 8),
                      _TypeChip(
                        label: '图片',
                        selected: _type == _PostType.images,
                        onTap: () => setState(() => _type = _PostType.images),
                      ),
                      const SizedBox(width: 8),
                      _TypeChip(
                        label: '视频',
                        selected: _type == _PostType.video,
                        onTap: () => setState(() => _type = _PostType.video),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: _addDemoMedia,
                    child: Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE8EAF0)),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 34,
                            color: Color(0xFF8A8FA3),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '上传图片/视频',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8A8FA3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _contentController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '这一刻的想法',
                    ),
                  ),
                  if (_mediaUrls.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _mediaUrls
                          .map(
                            (item) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            children: [
                              Image.network(
                                item,
                                width: 86,
                                height: 86,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                right: 6,
                                top: 6,
                                child: GestureDetector(
                                  onTap: () =>
                                      setState(() => _mediaUrls.remove(item)),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          .toList(),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        '# 话题',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      TextButton(onPressed: () {}, child: const Text('全部 >')),
                    ],
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

class _TypeChip extends StatelessWidget {
  const _TypeChip({
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          gradient: selected
              ? const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)])
              : null,
          color: selected ? null : const Color(0xFFF1F3F8),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF6F7480),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

enum _PostType { text, images, video }

class _PublishResult {
  const _PublishResult({
    required this.content,
    required this.type,
    required this.mediaUrls,
    required this.tags,
  });

  final String content;
  final _PostType type;
  final List<String> mediaUrls;
  final List<String> tags;
}