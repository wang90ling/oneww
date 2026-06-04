import '../models/article_item.dart';
import '../services/article_service.dart';
import 'base_list_view_model.dart';

class ArticleListViewModel extends BaseListViewModel<ArticleItem> {
  ArticleListViewModel({ArticleService? service}) : _service = service ?? ArticleService();

  final ArticleService _service;

  @override
  Future<List<ArticleItem>> fetchPage(int page) async {
    final articles = await _service.loadArticles(page: page);
    return articles;
  }
}
