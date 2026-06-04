import '../core/network/api_service.dart';
import '../models/article_item.dart';

class ArticleRepository {
  ArticleRepository({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<List<ArticleItem>> fetchArticles({int page = 0}) async {
    try {
      final response = await _apiService.fetchWanArticles(page);
      
      if (response.errorCode != 0) {
        throw Exception(response.errorMsg ?? '请求失败');
      }

      return response.data.datas.map((wanItem) {
        return ArticleItem(
          id: wanItem.id,
          title: wanItem.title,
          summary: wanItem.chapterName ?? wanItem.superChapterName ?? '',
          content: wanItem.link ?? '',
          author: wanItem.shareUser ??'匿名作者',
          date: wanItem.niceDate,
        );
      }).toList();
    } catch (error) {
      return const [];
    }
  }

  Future<ArticleItem?> fetchArticleDetail(int id) async {
    final articles = await fetchArticles();
    for (final article in articles) {
      if (article.id == id) {
        return article;
      }
    }
    return articles.isEmpty ? null : articles.first;
  }
}
