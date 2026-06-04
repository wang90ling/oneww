class ArticleItem {
  const ArticleItem({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.author,
    this.date,
  });

  final int id;
  final String title;
  final String summary;
  final String content;
  final String author;
  final String? date;
}
