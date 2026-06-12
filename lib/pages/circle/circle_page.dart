import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
      await Future<void>.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text('动态发布成功，已选择 ${result.mediaFiles.length} 个媒体文件')));
      await _viewModel.loadLatest();
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
  _PostType _type = _PostType.text;
  bool _isSelecting = false;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickMedia() async {
    if (_isSelecting) return;
    setState(() => _isSelecting = true);
    try {
      if (_type == _PostType.video) {
        final video = await widget.imagePicker.pickVideo(source: ImageSource.gallery);
        if (video == null) return;
        setState(() { _mediaFiles..clear()..add(video); });
      } else {
        final picked = await widget.imagePicker.pickMultiImage(imageQuality: 85);
        if (picked.isEmpty) return;
        setState(() { _mediaFiles.addAll(picked.take(9 - _mediaFiles.length)); });
      }
    } finally {
      if (mounted) setState(() => _isSelecting = false);
    }
  }

  void _removeMediaAt(int index) => setState(() => _mediaFiles.removeAt(index));

  void _submit() {
    final content = _contentController.text.trim();
    if (content.isEmpty && _mediaFiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请先输入内容或选择图片/视频')));
      return;
    }
    Navigator.pop(context, _PublishResult(content: content, type: _type, mediaFiles: List<XFile>.from(_mediaFiles), tags: const ['# 发动态']));
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final theme = Theme.of(context);
    final previewGrid = _mediaFiles.isEmpty
        ? const SizedBox.shrink()
        : GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _mediaFiles.length > 9 ? 9 : _mediaFiles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 1),
      itemBuilder: (context, index) {
        final item = _mediaFiles[index];
        final isVideo = _type == _PostType.video || item.path.toLowerCase().endsWith('.mp4') || item.path.toLowerCase().endsWith('.mov');
        return ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            fit: StackFit.expand,
            children: [
              isVideo
                  ? Container(color: const Color(0xFFF2F3F7), child: const Center(child: Icon(Icons.videocam_rounded, size: 36, color: Color(0xFF7A5CFF))))
                  : Image.file(File(item.path), fit: BoxFit.cover),
              Positioned(
                right: 6,
                top: 6,
                child: GestureDetector(
                  onTap: () => _removeMediaAt(index),
                  child: Container(decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle), child: const Icon(Icons.close, size: 16, color: Colors.white)),
                ),
              ),
              if (isVideo)
                Container(color: Colors.black.withValues(alpha: 0.2), child: const Center(child: Icon(Icons.play_circle_fill_rounded, color: Colors.white, size: 34))),
            ],
          ),
        );
      },
    );

    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 16 + bottomInset),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')), const Spacer(), Text('发高光', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)), const Spacer(), TextButton(onPressed: _submit, child: const Text('发布'))]),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFFF7F8FC), borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _TypeChip(label: '纯文字', selected: _type == _PostType.text, onTap: () { setState(() { _type = _PostType.text; _mediaFiles.clear(); }); }),
                      const SizedBox(width: 8),
                      _TypeChip(label: '图片', selected: _type == _PostType.images, onTap: () { setState(() { _type = _PostType.images; _mediaFiles.clear(); }); }),
                      const SizedBox(width: 8),
                      _TypeChip(label: '视频', selected: _type == _PostType.video, onTap: () { setState(() { _type = _PostType.video; _mediaFiles.clear(); }); }),
                    ],
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: _pickMedia,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE8EAF0))),
                      child: Column(
                        children: [
                          const Icon(Icons.add_photo_alternate_outlined, size: 34, color: Color(0xFF8A8FA3)),
                          const SizedBox(height: 6),
                          Text(_type == _PostType.video ? '选择视频' : '选择图片或视频', style: const TextStyle(fontSize: 12, color: Color(0xFF8A8FA3))),
                        ],
                      ),
                    ),
                  ),
                  if (_mediaFiles.isNotEmpty) ...[const SizedBox(height: 14), previewGrid],
                  const SizedBox(height: 14),
                  TextField(controller: _contentController, maxLines: 6, decoration: const InputDecoration(border: InputBorder.none, hintText: '这一刻的想法')),
                  const SizedBox(height: 16),
                  Row(children: [const Text('# 话题', style: TextStyle(fontWeight: FontWeight.w700)), const Spacer(), TextButton(onPressed: () {}, child: const Text('全部 >'))]),
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
        child: Text(label, style: TextStyle(color: selected ? Colors.white : const Color(0xFF6F7480), fontWeight: FontWeight.w600)),
      ),
    );
  }
}

enum _PostType { text, images, video }

class _PublishResult {
  const _PublishResult({required this.content, required this.type, required this.mediaFiles, required this.tags});
  final String content;
  final _PostType type;
  final List<XFile> mediaFiles;
  final List<String> tags;
}
