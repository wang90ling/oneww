class WanArticleResponse {
  WanArticleResponse({
    required this.data,
    required this.errorCode,
    this.errorMsg,
  });

  final WanArticleData data;
  final int errorCode;
  final String? errorMsg;

  factory WanArticleResponse.fromJson(Map<String, dynamic> json) {
    return WanArticleResponse(
      data: WanArticleData.fromJson(json['data'] as Map<String, dynamic>),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String?,
    );
  }
}

class WanArticleData {
  WanArticleData({
    required this.curPage,
    required this.datas,
    required this.pageCount,
    required this.total,
  });

  final int curPage;
  final List<WanArticleItem> datas;
  final int pageCount;
  final int total;

  factory WanArticleData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> datasJson = json['datas'] as List;
    return WanArticleData(
      curPage: json['curPage'] as int,
      datas: datasJson
          .map((item) => WanArticleItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      pageCount: json['pageCount'] as int,
      total: json['total'] as int,
    );
  }
}

class WanArticleItem {
  WanArticleItem({
    required this.id,
    required this.title,
    required this.author,
    required this.niceDate,
    this.link,
    this.chapterName,
    this.superChapterName,
    this.shareUser,
  });

  final int id;
  final String title;
  final String author;
  final String niceDate;
  final String? link;
  final String? chapterName;
  final String? superChapterName;
  final String? shareUser;

  factory WanArticleItem.fromJson(Map<String, dynamic> json) {
    return WanArticleItem(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      niceDate: json['niceDate'] as String,
      link: json['link'] as String?,
      chapterName: json['chapterName'] as String?,
      superChapterName: json['superChapterName'] as String?,
      shareUser: json['shareUser'] as String?,

    );
  }
}
