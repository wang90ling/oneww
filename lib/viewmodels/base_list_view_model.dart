import 'package:flutter/foundation.dart';
import 'package:oneww/core/helpers/app_logger.dart';

import 'view_state.dart';

abstract class BaseListViewModel<T> extends ChangeNotifier {
  ViewStatus _status = ViewStatus.initial;
  String? _errorMessage;
  final List<T> _items = [];
  int _page = 1;
  bool _hasMore = true;

  ViewStatus get status => _status;
  String? get errorMessage => _errorMessage;
  List<T> get items => List.unmodifiable(_items);
  int get page => _page;
  bool get hasMore => _hasMore;
  bool get isLoading => _status == ViewStatus.loading;
  bool get isEmpty => _items.isEmpty;

  @protected
  Future<List<T>> fetchPage(int page);

  @protected
  void updateHasMore(bool value) {
    _hasMore = value;
  }

  @protected
  void updateStatus(ViewStatus status, {String? errorMessage}) {
    _status = status;
    _errorMessage = errorMessage;
    notifyListeners();
  }

  Future<void> loadFirstPage() async {
    updateStatus(ViewStatus.loading);
    try {
      final data = await fetchPage(1);
      _items
        ..clear()
        ..addAll(data);
      _page = 1;
      _hasMore = data.isNotEmpty;
      updateStatus(data.isEmpty ? ViewStatus.empty : ViewStatus.success);
      AppLogger.info("data:"+data.length.toString(),tag:"wangling");
    } catch (error) {
      updateStatus(ViewStatus.error, errorMessage: error.toString());
    }
  }

  Future<void> refresh() async {
    updateStatus(ViewStatus.refreshing);
    try {
      final data = await fetchPage(1);
      _items
        ..clear()
        ..addAll(data);
      _page = 1;
      _hasMore = data.isNotEmpty;
      updateStatus(data.isEmpty ? ViewStatus.empty : ViewStatus.success);
    } catch (error) {
      updateStatus(ViewStatus.error, errorMessage: error.toString());
    }
  }

  Future<void> loadMore() async {
    if (!_hasMore || _status == ViewStatus.loadingMore || _status == ViewStatus.loading) {
      return;
    }
    updateStatus(ViewStatus.loadingMore);
    try {
      final nextPage = _page + 1;
      final data = await fetchPage(nextPage);
      if (data.isEmpty) {
        _hasMore = false;
      } else {
        _items.addAll(data);
        _page = nextPage;
      }
      updateStatus(_items.isEmpty ? ViewStatus.empty : ViewStatus.success);
    } catch (error) {
      updateStatus(ViewStatus.error, errorMessage: error.toString());
    }
  }
}
