import 'package:flutter/foundation.dart';

import '../models/post_list_response_entity.dart';
import '../repositories/circle_repository.dart';
import 'view_state.dart';

class CircleViewModel extends ChangeNotifier {
  CircleViewModel({CircleRepository? repository}) : _repository = repository ?? CircleRepository();

  final CircleRepository _repository;

  ViewStatus _status = ViewStatus.initial;
  String? _errorMessage;
  List<PostListResponseData> _posts = <PostListResponseData>[];
  int _selectedTabIndex = 1;
  bool _isPublishing = false;

  ViewStatus get status => _status;
  String? get errorMessage => _errorMessage;
  List<PostListResponseData> get posts => _posts;
  int get selectedTabIndex => _selectedTabIndex;
  bool get isPublishing => _isPublishing;

  Future<void> loadLatest() async {
    _status = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _posts = await _repository.fetchLatestCircles();
      _status = _posts.isEmpty ? ViewStatus.empty : ViewStatus.success;
      notifyListeners();
    } catch (error) {
      _errorMessage = error.toString();
      _status = ViewStatus.error;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    _status = ViewStatus.refreshing;
    notifyListeners();
    await loadLatest();
  }

  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void toggleLike(int index) {
    if (index < 0 || index >= _posts.length) return;
    final post = _posts[index];
    final liked = (post.likedFlag ?? 0) == 1;
    post.likedFlag = liked ? 0 : 1;
    final count = post.likesCount ?? 0;
    post.likesCount = liked ? (count > 0 ? count - 1 : 0) : count + 1;
    notifyListeners();
  }

  void sharePost(int index) {
    if (index < 0 || index >= _posts.length) return;
    final post = _posts[index];
    post.shareCount = (post.shareCount ?? 0) + 1;
    notifyListeners();
  }

  Future<void> setPublishing(bool value) async {
    _isPublishing = value;
    notifyListeners();
  }
}
