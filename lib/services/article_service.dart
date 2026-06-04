import '../models/article_item.dart';
import '../repositories/article_repository.dart';

class ArticleService {
  ArticleService({ArticleRepository? repository})
      : _repository = repository ?? ArticleRepository();

  final ArticleRepository _repository;

  Future<List<ArticleItem>> loadArticles({int page = 0}) {
    return _repository.fetchArticles(page: page);
  }

  Future<ArticleItem?> loadArticleDetail(int id) {
    return _repository.fetchArticleDetail(id);
  }
}
