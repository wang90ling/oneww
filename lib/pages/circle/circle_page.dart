import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

import '../../models/post_list_response_entity.dart';
import '../../repositories/circle_repository.dart';
import '../../viewmodels/circle_view_model.dart';
import '../../viewmodels/view_state.dart';

/// 圈子页面
class CirclePage extends StatefulWidget {
  const CirclePage({super.key});

  @override
  State<CirclePage> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  late final CircleViewModel _viewModel;
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _viewModel = CircleViewModel(repository: CircleRepository())..loadLatest();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _openPublishSheet() async {
    final result = await showModalBottomSheet<_PublishResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _PublishSheet(imagePicker: _imagePicker),
    );

    if (!mounted || result == null) return;

    await _viewModel.setPublishing(true);
    try {
      final uploadedUrls = <String>[];
      for (final file in result.mediaFiles) {
        uploadedUrls.add(await _viewModel.uploadMediaFile(file));
      }

      await _viewModel.createCirclePost(
        content: result.content,
        mediaUrls: uploadedUrls,
        mediaType: result.mediaType.value,
        topicIds: result.topicIds,
        visibility: result.visibility.apiValue,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(const SnackBar(content: Text('动态发布成功')));
      await _viewModel.loadLatest();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text('发布失败：$error')));
    } finally {
      if (mounted) {
        await _viewModel.setPublishing(false);
      }
    }
  }

  void _openComments(PostListResponseData post) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _CommentSheet(post: post),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8FC),
        body: SafeArea(
          child: Stack(
            children: [
              Consumer<CircleViewModel>(
                builder: (context, vm, _) {
                  return CustomScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(child: _buildTopTabs(context, vm)),
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
                            child: const Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.auto_awesome_rounded, color: Color(0xFF7A5CFF)),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '发现圈友的精彩瞬间',
                                        style: TextStyle(fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(height: 4),
                                      Text('图文 / 视频 / 纯文字动态都可以发布'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 12)),
                      if (vm.status == ViewStatus.loading && vm.posts.isEmpty)
                        const SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(child: CircularProgressIndicator()),
                        )
                      else if (vm.status == ViewStatus.error && vm.posts.isEmpty)
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    vm.errorMessage ?? '加载失败',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    onPressed: vm.loadLatest,
                                    child: const Text('重试'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      else if (vm.posts.isEmpty)
                          const SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(child: Text('暂无动态')),
                          )
                        else
                          SliverPadding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
                            sliver: SliverList.separated(
                              itemCount: vm.posts.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 14),
                              itemBuilder: (context, index) {
                                final post = vm.posts[index];
                                return _CirclePostCard(
                                  post: post,
                                  onShare: () => vm.sharePost(index),
                                  onLike: () => vm.toggleLike(index),
                                  onComment: () => _openComments(post),
                                );
                              },
                            ),
                          ),
                      const SliverToBoxAdapter(child: SizedBox(height: 90)),
                    ],
                  );
                },
              ),
              Positioned(
                right: 16,
                bottom: 24,
                child: Consumer<CircleViewModel>(
                  builder: (context, vm, _) {
                    return AnimatedScale(
                      scale: vm.isPublishing ? 0.95 : 1,
                      duration: const Duration(milliseconds: 180),
                      child: _PublishFloatingButton(onTap: _openPublishSheet),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopTabs(BuildContext context, CircleViewModel vm) {
    final theme = Theme.of(context);
    final tabs = ['关注', '最新', '最热'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (int index = 0; index < tabs.length; index++) ...[
            GestureDetector(
              onTap: () => vm.selectTab(index),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: vm.selectedTabIndex == index ? FontWeight.w900 : FontWeight.w600,
                  color: vm.selectedTabIndex == index ? const Color(0xFF111111) : Colors.grey.shade600,
                ),
                child: Text(tabs[index]),
              ),
            ),
            if (index != tabs.length - 1) const SizedBox(width: 24),
          ],
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
  const _CirclePostCard({required this.post, required this.onShare, required this.onLike, required this.onComment});

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
      final displayUrl = _isVideoPost ? (coverUrl.isNotEmpty ? coverUrl : fileUrl) : (fileUrl.isNotEmpty ? fileUrl : coverUrl);
      if (displayUrl.isNotEmpty) result.add(_MediaPreview(url: displayUrl, isVideo: _isVideoPost));
    }
    if (result.isEmpty) {
      for (final url in post.files ?? <String>[]) {
        final clean = url.trim();
        if (clean.isNotEmpty) result.add(_MediaPreview(url: clean, isVideo: _isVideoPost));
      }
    }
    return result;
  }

  String _formatCount(int? value, String emptyText) {
    final count = value ?? 0;
    if (count <= 0) return emptyText;
    if (count >= 10000) {
      final v = count / 10000;
      return '${v.toStringAsFixed(v.truncateToDouble() == v ? 0 : 1)}w';
    }
    if (count >= 1000) {
      final v = count / 1000;
      return '${v.toStringAsFixed(v.truncateToDouble() == v ? 0 : 1)}k';
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
      ...?post.subjects?.map((e) => (e.name ?? '').trim()).where((e) => e.isNotEmpty).map((e) => '#$e'),
      if (location.isNotEmpty) '#$location',
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 20, offset: const Offset(0, 8))],
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
                          child: Text(nickName, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, color: colorScheme.onSurface), overflow: TextOverflow.ellipsis),
                        ),
                        if ((post.topFlag ?? 0) == 1) ...[
                          const SizedBox(width: 6),
                          const _Badge(text: '置顶', colors: [Color(0xFF5A7BFF), Color(0xFFEF6AD7)]),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(timeText.isNotEmpty ? timeText : '刚刚', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                    if (location.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 14, color: colorScheme.onSurfaceVariant),
                          const SizedBox(width: 4),
                          Expanded(child: Text(location, style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant), overflow: TextOverflow.ellipsis)),
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
            Text(content, style: theme.textTheme.bodyLarge?.copyWith(height: 1.45, color: colorScheme.onSurface)),
          ],
          if (tags.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags
                  .map((e) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: const Color(0xFFF5F7FF), borderRadius: BorderRadius.circular(999)),
                child: Text(e, style: const TextStyle(color: Color(0xFF5A7BFF), fontSize: 12, fontWeight: FontWeight.w600)),
              ))
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
              _ActionButton(icon: Icons.mode_comment_outlined, label: _formatCount(post.commentCount, '评论'), onTap: onComment),
              const Spacer(),
              _ActionButton(icon: Icons.share_outlined, label: _formatCount(post.shareCount, '分享'), onTap: onShare),
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
            ? Image.network(url, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: const Color(0xFFF1F3F8), child: const Icon(Icons.person_rounded, color: Color(0xFF8E8E8E))))
            : Container(color: const Color(0xFFF1F3F8), child: const Icon(Icons.person_rounded, color: Color(0xFF8E8E8E))),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text, required this.colors});
  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(gradient: LinearGradient(colors: colors), borderRadius: BorderRadius.circular(999)),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
    );
  }
}

class _MediaPreview {
  const _MediaPreview({required this.url, required this.isVideo});
  final String url;
  final bool isVideo;
}

class _MediaGrid extends StatelessWidget {
  const _MediaGrid({required this.media});
  final List<_MediaPreview> media;

  @override
  Widget build(BuildContext context) {
    if (media.isEmpty) return const SizedBox.shrink();
    const maxGridCount = 9;
    final showCount = media.length > maxGridCount ? maxGridCount : media.length;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: showCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 1),
      itemBuilder: (context, index) {
        final item = media[index];
        final showMore = index == maxGridCount - 1 && media.length > maxGridCount;
        return ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(item.url, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: const Color(0xFFF2F3F7), child: const Center(child: Icon(Icons.broken_image_outlined)))),
              if (item.isVideo)
                Container(
                  color: Colors.black.withValues(alpha: 0.18),
                  child: const Center(child: Icon(Icons.play_circle_fill_rounded, size: 30, color: Colors.white)),
                ),
              if (showMore)
                Container(
                  color: Colors.black.withValues(alpha: 0.45),
                  child: Center(
                    child: Text('+${media.length - maxGridCount}', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
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
  const _ActionButton({required this.icon, required this.label, required this.onTap, this.iconColor});
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
            Text(label, style: TextStyle(color: colorScheme.onSurface, fontWeight: FontWeight.w600)),
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
              gradient: LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]),
              boxShadow: [BoxShadow(color: Color(0x337A5CFF), blurRadius: 18, offset: Offset(0, 8))],
            ),
            child: const Icon(Icons.add_rounded, color: Colors.white, size: 34),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(color: const Color(0xFF7A5CFF), borderRadius: BorderRadius.circular(999)),
          child: const Text('发动态', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
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
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 42, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(999))),
          const SizedBox(height: 14),
          Row(children: [Text('评论 · ${post.commentCount ?? 0}', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)), const Spacer(), IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close_rounded))]),
          const SizedBox(height: 8),
          if (latestComment.isNotEmpty)
            Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFFF7F8FC), borderRadius: BorderRadius.circular(16)), child: Text(latestComment, style: theme.textTheme.bodyMedium)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFF7F8FC), borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                const CircleAvatar(radius: 18, child: Icon(Icons.person_rounded)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: '写下你的评论...', border: InputBorder.none, isDense: true, hintStyle: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('发送')),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Flexible(child: Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text('这里可以接入真实评论列表。当前已按接口结构展示。'))),
        ],
      ),
    );
  }
}

class _PublishSheet extends StatefulWidget {
  const _PublishSheet({required this.imagePicker});

  final ImagePicker imagePicker;

  @override
  State<_PublishSheet> createState() => _PublishSheetState();
}

class _PublishSheetState extends State<_PublishSheet> {
  final TextEditingController _contentController = TextEditingController();
  final List<XFile> _mediaFiles = <XFile>[];
  final List<_TopicItem> _selectedTopics = <_TopicItem>[];
  _PostType _type = _PostType.text;
  _VisibilityOption _visibility = _VisibilityOption.all;
  bool _isSelecting = false;
  bool _albumLoading = false;
  List<AssetPathEntity> _albumPaths = <AssetPathEntity>[];
  AssetPathEntity? _currentAlbum;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _loadAlbums({AssetPathEntity? preferred}) async {
    if (_albumLoading) return;
    setState(() => _albumLoading = true);
    try {
      final permission = await PhotoManager.requestPermissionExtend();
      if (!permission.isAuth && !permission.hasAccess) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('需要相册权限才能选择图片/视频')));
        return;
      }

      final paths = await PhotoManager.getAssetPathList(
        type: _type == _PostType.video ? RequestType.video : RequestType.image,
        hasAll: true,
        onlyAll: false,
      );
      if (paths.isEmpty) return;

      final album = preferred ?? _currentAlbum ?? paths.first;
      await album.getAssetListPaged(page: 0, size: 1000);
      if (!mounted) return;
      setState(() {
        _albumPaths = paths;
        _currentAlbum = album;
      });
    } finally {
      if (mounted) setState(() => _albumLoading = false);
    }
  }

  Future<void> _showAlbumSelector() async {
    if (_albumPaths.isEmpty) {
      await _loadAlbums();
    }
    if (!mounted || _albumPaths.isEmpty) return;

    final selected = await showModalBottomSheet<AssetPathEntity>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            height: 360,
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(width: 42, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(999))),
                const SizedBox(height: 12),
                const Text('相册', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.separated(
                    itemCount: _albumPaths.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final album = _albumPaths[index];
                      return ListTile(
                        title: Text(album.name.isEmpty ? '未命名相册' : album.name),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () => Navigator.pop(context, album),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (!mounted || selected == null) return;
    await _loadAlbums(preferred: selected);
  }

  Future<void> _showMediaSourceSheet() async {
    final choice = await showModalBottomSheet<_MediaChoice>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(width: 42, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(999))),
              const SizedBox(height: 12),
              const Text('选择图片/视频', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              ListTile(
                title: const Text('图片'),
                onTap: () => Navigator.pop(context, _MediaChoice.images),
              ),
              ListTile(
                title: const Text('视频'),
                onTap: () => Navigator.pop(context, _MediaChoice.video),
              ),
              const SizedBox(height: 12),
              const Divider(height: 1),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('取消'),
              ),
            ],
          ),
        );
      },
    );

    if (!mounted || choice == null) return;
    if (choice == _MediaChoice.images) {
      await _pickImages();
    } else if (choice == _MediaChoice.video) {
      await _pickVideo();
    }
  }

  Future<void> _pickImages() async {
    if (_isSelecting) return;
    if (_mediaFiles.any((item) => _isVideoPath(item.path)) || _type == _PostType.video) {
      setState(() {
        _mediaFiles.clear();
        _type = _PostType.images;
      });
    } else {
      setState(() => _type = _PostType.images);
    }

    final remaining = 9 - _mediaFiles.length;
    if (remaining <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('图片最多选择 9 张')));
      return;
    }

    setState(() => _isSelecting = true);
    try {
      final picked = await widget.imagePicker.pickMultiImage(imageQuality: 85);
      if (picked.isEmpty) return;
      final nextFiles = picked.take(remaining).toList();
      if (mounted) {
        setState(() {
          _mediaFiles.addAll(nextFiles);
          _type = _PostType.images;
        });
      }
    } finally {
      if (mounted) setState(() => _isSelecting = false);
    }
  }

  Future<void> _pickVideo() async {
    if (_isSelecting) return;
    setState(() => _isSelecting = true);
    try {
      final video = await widget.imagePicker.pickVideo(source: ImageSource.gallery);
      if (video == null) return;
      if (mounted) {
        setState(() {
          _mediaFiles
            ..clear()
            ..add(video);
          _type = _PostType.video;
        });
      }
    } finally {
      if (mounted) setState(() => _isSelecting = false);
    }
  }

  void _removeMediaAt(int index) {
    setState(() {
      _mediaFiles.removeAt(index);
      if (_mediaFiles.isEmpty) {
        _type = _PostType.text;
      }
    });
  }

  Future<void> _pickTopics() async {
    final result = await showModalBottomSheet<List<_TopicItem>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => _TopicPickerSheet(
        topics: _availableTopics,
        selectedTopics: _selectedTopics,
      ),
    );

    if (!mounted || result == null) return;
    setState(() {
      _selectedTopics
        ..clear()
        ..addAll(result);
    });
  }

  Future<void> _pickVisibility() async {
    final result = await showModalBottomSheet<_VisibilityOption>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => _VisibilityPickerSheet(selected: _visibility),
    );

    if (!mounted || result == null) return;
    setState(() => _visibility = result);
  }

  void _submit() {
    final content = _contentController.text.trim();
    if (content.isEmpty && _mediaFiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请先输入内容或选择图片/视频')));
      return;
    }

    Navigator.pop(
      context,
      _PublishResult(
        content: content,
        mediaFiles: List<XFile>.from(_mediaFiles),
        mediaType: _type,
        topicIds: _selectedTopics.map((e) => e.id).toList(),
        visibility: _visibility,
      ),
    );
  }

  bool _isVideoPath(String path) {
    final lower = path.toLowerCase();
    return lower.endsWith('.mp4') || lower.endsWith('.mov') || lower.endsWith('.m4v') || lower.endsWith('.avi');
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 16 + bottomInset),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
                const Spacer(),
                Text('发高光', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                const Spacer(),
                TextButton(onPressed: _submit, child: const Text('发布')),
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
                      _TypeChip(label: '纯文字', selected: _type == _PostType.text, onTap: () => setState(() => _type = _PostType.text)),
                      const SizedBox(width: 8),
                      _TypeChip(label: '图片', selected: _type == _PostType.images, onTap: () => setState(() => _type = _PostType.images)),
                      const SizedBox(width: 8),
                      _TypeChip(label: '视频', selected: _type == _PostType.video, onTap: () => setState(() => _type = _PostType.video)),
                    ],
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () async {
                      if (_type == _PostType.text) {
                        await _showMediaSourceSheet();
                      } else {
                        await _showAlbumSelector();
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE8EAF0)),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.add_photo_alternate_outlined, size: 34, color: Color(0xFF8A8FA3)),
                          const SizedBox(height: 6),
                          Text(
                            _type == _PostType.video ? '上传视频' : '上传图片/视频',
                            style: const TextStyle(fontSize: 12, color: Color(0xFF8A8FA3)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_mediaFiles.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    _MediaPreviewGrid(
                      mediaFiles: _mediaFiles,
                      mediaType: _type,
                      onRemove: _removeMediaAt,
                    ),
                  ],
                  if (_type == _PostType.images || _type == _PostType.video) ...[
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: _showAlbumSelector,
                      icon: const Icon(Icons.photo_library_outlined, size: 18),
                      label: Text(_currentAlbum?.name.isNotEmpty == true ? _currentAlbum!.name : '切换相册'),
                    ),
                  ],
                  const SizedBox(height: 14),
                  TextField(
                    controller: _contentController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '这一刻的想法',
                    ),
                  ),
                  const SizedBox(height: 14),
                  InkWell(
                    onTap: _pickTopics,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE8EAF0)),
                      ),
                      child: Row(
                        children: [
                          const Text('# 话题', style: TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _selectedTopics.isEmpty
                                ? Text('选择要参与的话题', style: TextStyle(color: Colors.grey.shade500))
                                : Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: _selectedTopics
                                        .map(
                                          (topic) => Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(colors: [Color(0xFFEDE7FF), Color(0xFFFFECF8)]),
                                              borderRadius: BorderRadius.circular(999),
                                            ),
                                            child: Text(topic.name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF5A5A5A))),
                                          ),
                                        )
                                        .toList(),
                                  ),
                          ),
                          const SizedBox(width: 8),
                          const Text('全部 >', style: TextStyle(color: Color(0xFF8A8FA3))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: _pickVisibility,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE8EAF0)),
                      ),
                      child: Row(
                        children: [
                          const Text('谁可以看', style: TextStyle(fontWeight: FontWeight.w700)),
                          const Spacer(),
                          Text(_visibility.label, style: const TextStyle(color: Color(0xFF7A5CFF), fontWeight: FontWeight.w700)),
                          const SizedBox(width: 6),
                          const Icon(Icons.chevron_right_rounded, color: Color(0xFF8A8FA3)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '图片最多选择 9 张，视频只能选择 1 个',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
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
  const _TypeChip({required this.label, required this.selected, required this.onTap});

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
          gradient: selected ? const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]) : null,
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

class _TopicPickerSheet extends StatefulWidget {
  const _TopicPickerSheet({required this.topics, required this.selectedTopics});

  final List<_TopicItem> topics;
  final List<_TopicItem> selectedTopics;

  @override
  State<_TopicPickerSheet> createState() => _TopicPickerSheetState();
}

class _TopicPickerSheetState extends State<_TopicPickerSheet> {
  late final List<_TopicItem> _selected = List<_TopicItem>.from(widget.selectedTopics);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 42, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(999))),
            const SizedBox(height: 12),
            Row(
              children: [
                const Spacer(),
                const Text('选择话题', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                const Spacer(),
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close_rounded)),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.topics.map((topic) {
                final selected = _selected.any((item) => item.id == topic.id);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selected) {
                        _selected.removeWhere((item) => item.id == topic.id);
                      } else {
                        _selected.add(topic);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      gradient: selected ? const LinearGradient(colors: [Color(0xFFEFE7FF), Color(0xFFFFECF8)]) : null,
                      color: selected ? null : const Color(0xFFF6F7FA),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: selected ? const Color(0xFFBFA5FF) : Colors.transparent),
                    ),
                    child: Text(
                      topic.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: selected ? const Color(0xFF6B57D6) : const Color(0xFF555555),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, _selected),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7A5CFF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('完成'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VisibilityPickerSheet extends StatelessWidget {
  const _VisibilityPickerSheet({required this.selected});

  final _VisibilityOption selected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 42, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(999))),
            const SizedBox(height: 12),
            Row(
              children: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
                const Spacer(),
                const Text('谁能看见', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                const Spacer(),
                const SizedBox(width: 72),
              ],
            ),
            const SizedBox(height: 8),
            for (final option in _VisibilityOption.values)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(option.label, style: const TextStyle(fontWeight: FontWeight.w600)),
                leading: option == selected
                    ? const Icon(Icons.check_rounded, color: Color(0xFF7A5CFF))
                    : const SizedBox(width: 24),
                onTap: () => Navigator.pop(context, option),
              ),
          ],
        ),
      ),
    );
  }
}

class _MediaPreviewGrid extends StatelessWidget {
  const _MediaPreviewGrid({required this.mediaFiles, required this.mediaType, required this.onRemove});

  final List<XFile> mediaFiles;
  final _PostType mediaType;
  final void Function(int index) onRemove;

  bool _isVideo(String path) {
    final lower = path.toLowerCase();
    return lower.endsWith('.mp4') || lower.endsWith('.mov') || lower.endsWith('.m4v') || lower.endsWith('.avi');
  }

  @override
  Widget build(BuildContext context) {
    if (mediaFiles.isEmpty) return const SizedBox.shrink();

    final isVideo = mediaType == _PostType.video || (mediaFiles.isNotEmpty && _isVideo(mediaFiles.first.path));
    if (isVideo) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: const Color(0xFFF2F3F7),
              child: const Center(
                child: Icon(Icons.videocam_rounded, size: 56, color: Color(0xFF7A5CFF)),
              ),
            ),
            Container(color: Colors.black.withValues(alpha: 0.18)),
            const Center(child: Icon(Icons.play_circle_fill_rounded, color: Colors.white, size: 54)),
            Positioned(
              right: 8,
              top: 8,
              child: GestureDetector(
                onTap: () => onRemove(0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                  child: const Icon(Icons.close, size: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }

    final showCount = mediaFiles.length > 9 ? 9 : mediaFiles.length;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: showCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = mediaFiles[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.file(File(item.path), fit: BoxFit.cover),
              Positioned(
                right: 6,
                top: 6,
                child: GestureDetector(
                  onTap: () => onRemove(index),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                    child: const Icon(Icons.close, size: 16, color: Colors.white),
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

class _TypeChip1 extends StatelessWidget {
  const _TypeChip1({required this.label, required this.selected, required this.onTap});

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
          gradient: selected ? const LinearGradient(colors: [Color(0xFF7A5CFF), Color(0xFFFF6FB3)]) : null,
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

enum _PostType {
  text(0),
  images(1),
  video(2);

  const _PostType(this.value);

  final int value;
}

enum _MediaChoice { images, video }

enum _VisibilityOption {
  all('全部', 'all'),
  mutual('互关可见', 'mutual'),
  fans('粉丝可见', 'fans'),
  following('关注可见', 'following'),
  onlySelf('仅自己', 'self');

  const _VisibilityOption(this.label, this.apiValue);

  final String label;
  final String apiValue;
}

class _TopicItem {
  const _TopicItem({required this.id, required this.name, this.hot = false});

  final String id;
  final String name;
  final bool hot;
}

const List<_TopicItem> _availableTopics = <_TopicItem>[
  _TopicItem(id: '1', name: '生活健身', hot: true),
  _TopicItem(id: '2', name: '游戏分享', hot: true),
  _TopicItem(id: '3', name: '容貌焦虑-宽图'),
  _TopicItem(id: '4', name: '健身天地-长图'),
  _TopicItem(id: '5', name: '旅行打卡'),
  _TopicItem(id: '6', name: '美食日常'),
];

class _PublishResult {
  const _PublishResult({
    required this.content,
    required this.mediaFiles,
    required this.mediaType,
    required this.topicIds,
    required this.visibility,
  });

  final String content;
  final List<XFile> mediaFiles;
  final _PostType mediaType;
  final List<String> topicIds;
  final _VisibilityOption visibility;
}
