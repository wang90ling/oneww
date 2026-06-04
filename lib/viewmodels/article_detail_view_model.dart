import '../models/article_item.dart';
import '../repositories/article_repository.dart';
import 'package:flutter/foundation.dart';
import 'view_state.dart';

class ArticleDetailViewModel extends ChangeNotifier {
  ArticleDetailViewModel({ArticleRepository? repository})
      : _repository = repository ?? ArticleRepository();

  final ArticleRepository _repository;

  ViewStatus _status = ViewStatus.initial;
  String? _errorMessage;
  ArticleItem? _article;

  ViewStatus get status => _status;
  String? get errorMessage => _errorMessage;
  ArticleItem? get article => _article;

  Future<void> loadDetail(int id) async {
    _status = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _article = await _repository.fetchArticleDetail(id);
      _status = _article == null ? ViewStatus.empty : ViewStatus.success;
      notifyListeners();
    } catch (error) {
      _errorMessage = error.toString();
      _status = ViewStatus.error;
      notifyListeners();
    }
  }
}
