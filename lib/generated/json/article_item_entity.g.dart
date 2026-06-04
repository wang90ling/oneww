import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/article_item_entity.dart';

ArticleItemEntity $ArticleItemEntityFromJson(Map<String, dynamic> json) {
  final ArticleItemEntity articleItemEntity = ArticleItemEntity();
  final ArticleItemData? data = jsonConvert.convert<ArticleItemData>(
      json['data']);
  if (data != null) {
    articleItemEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    articleItemEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    articleItemEntity.errorMsg = errorMsg;
  }
  return articleItemEntity;
}

Map<String, dynamic> $ArticleItemEntityToJson(ArticleItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

extension ArticleItemEntityExtension on ArticleItemEntity {
  ArticleItemEntity copyWith({
    ArticleItemData? data,
    int? errorCode,
    String? errorMsg,
  }) {
    return ArticleItemEntity()
      ..data = data ?? this.data
      ..errorCode = errorCode ?? this.errorCode
      ..errorMsg = errorMsg ?? this.errorMsg;
  }
}

ArticleItemData $ArticleItemDataFromJson(Map<String, dynamic> json) {
  final ArticleItemData articleItemData = ArticleItemData();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    articleItemData.curPage = curPage;
  }
  final List<ArticleItemDataDatas>? datas = (json['datas'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ArticleItemDataDatas>(e) as ArticleItemDataDatas)
      .toList();
  if (datas != null) {
    articleItemData.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    articleItemData.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    articleItemData.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    articleItemData.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    articleItemData.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    articleItemData.total = total;
  }
  return articleItemData;
}

Map<String, dynamic> $ArticleItemDataToJson(ArticleItemData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['curPage'] = entity.curPage;
  data['datas'] = entity.datas.map((v) => v.toJson()).toList();
  data['offset'] = entity.offset;
  data['over'] = entity.over;
  data['pageCount'] = entity.pageCount;
  data['size'] = entity.size;
  data['total'] = entity.total;
  return data;
}

extension ArticleItemDataExtension on ArticleItemData {
  ArticleItemData copyWith({
    int? curPage,
    List<ArticleItemDataDatas>? datas,
    int? offset,
    bool? over,
    int? pageCount,
    int? size,
    int? total,
  }) {
    return ArticleItemData()
      ..curPage = curPage ?? this.curPage
      ..datas = datas ?? this.datas
      ..offset = offset ?? this.offset
      ..over = over ?? this.over
      ..pageCount = pageCount ?? this.pageCount
      ..size = size ?? this.size
      ..total = total ?? this.total;
  }
}

ArticleItemDataDatas $ArticleItemDataDatasFromJson(Map<String, dynamic> json) {
  final ArticleItemDataDatas articleItemDataDatas = ArticleItemDataDatas();
  final bool? adminAdd = jsonConvert.convert<bool>(json['adminAdd']);
  if (adminAdd != null) {
    articleItemDataDatas.adminAdd = adminAdd;
  }
  final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
  if (apkLink != null) {
    articleItemDataDatas.apkLink = apkLink;
  }
  final int? audit = jsonConvert.convert<int>(json['audit']);
  if (audit != null) {
    articleItemDataDatas.audit = audit;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    articleItemDataDatas.author = author;
  }
  final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
  if (canEdit != null) {
    articleItemDataDatas.canEdit = canEdit;
  }
  final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
  if (chapterId != null) {
    articleItemDataDatas.chapterId = chapterId;
  }
  final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
  if (chapterName != null) {
    articleItemDataDatas.chapterName = chapterName;
  }
  final bool? collect = jsonConvert.convert<bool>(json['collect']);
  if (collect != null) {
    articleItemDataDatas.collect = collect;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    articleItemDataDatas.courseId = courseId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    articleItemDataDatas.desc = desc;
  }
  final String? descMd = jsonConvert.convert<String>(json['descMd']);
  if (descMd != null) {
    articleItemDataDatas.descMd = descMd;
  }
  final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
  if (envelopePic != null) {
    articleItemDataDatas.envelopePic = envelopePic;
  }
  final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
  if (fresh != null) {
    articleItemDataDatas.fresh = fresh;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    articleItemDataDatas.host = host;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    articleItemDataDatas.id = id;
  }
  final bool? isAdminAdd = jsonConvert.convert<bool>(json['isAdminAdd']);
  if (isAdminAdd != null) {
    articleItemDataDatas.isAdminAdd = isAdminAdd;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    articleItemDataDatas.link = link;
  }
  final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
  if (niceDate != null) {
    articleItemDataDatas.niceDate = niceDate;
  }
  final String? niceShareDate = jsonConvert.convert<String>(
      json['niceShareDate']);
  if (niceShareDate != null) {
    articleItemDataDatas.niceShareDate = niceShareDate;
  }
  final String? origin = jsonConvert.convert<String>(json['origin']);
  if (origin != null) {
    articleItemDataDatas.origin = origin;
  }
  final String? prefix = jsonConvert.convert<String>(json['prefix']);
  if (prefix != null) {
    articleItemDataDatas.prefix = prefix;
  }
  final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
  if (projectLink != null) {
    articleItemDataDatas.projectLink = projectLink;
  }
  final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
  if (publishTime != null) {
    articleItemDataDatas.publishTime = publishTime;
  }
  final int? realSuperChapterId = jsonConvert.convert<int>(
      json['realSuperChapterId']);
  if (realSuperChapterId != null) {
    articleItemDataDatas.realSuperChapterId = realSuperChapterId;
  }
  final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
  if (selfVisible != null) {
    articleItemDataDatas.selfVisible = selfVisible;
  }
  final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
  if (shareDate != null) {
    articleItemDataDatas.shareDate = shareDate;
  }
  final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
  if (shareUser != null) {
    articleItemDataDatas.shareUser = shareUser;
  }
  final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
  if (superChapterId != null) {
    articleItemDataDatas.superChapterId = superChapterId;
  }
  final String? superChapterName = jsonConvert.convert<String>(
      json['superChapterName']);
  if (superChapterName != null) {
    articleItemDataDatas.superChapterName = superChapterName;
  }
  final List<dynamic>? tags = (json['tags'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (tags != null) {
    articleItemDataDatas.tags = tags;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    articleItemDataDatas.title = title;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    articleItemDataDatas.type = type;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    articleItemDataDatas.userId = userId;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    articleItemDataDatas.visible = visible;
  }
  final int? zan = jsonConvert.convert<int>(json['zan']);
  if (zan != null) {
    articleItemDataDatas.zan = zan;
  }
  return articleItemDataDatas;
}

Map<String, dynamic> $ArticleItemDataDatasToJson(ArticleItemDataDatas entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['adminAdd'] = entity.adminAdd;
  data['apkLink'] = entity.apkLink;
  data['audit'] = entity.audit;
  data['author'] = entity.author;
  data['canEdit'] = entity.canEdit;
  data['chapterId'] = entity.chapterId;
  data['chapterName'] = entity.chapterName;
  data['collect'] = entity.collect;
  data['courseId'] = entity.courseId;
  data['desc'] = entity.desc;
  data['descMd'] = entity.descMd;
  data['envelopePic'] = entity.envelopePic;
  data['fresh'] = entity.fresh;
  data['host'] = entity.host;
  data['id'] = entity.id;
  data['isAdminAdd'] = entity.isAdminAdd;
  data['link'] = entity.link;
  data['niceDate'] = entity.niceDate;
  data['niceShareDate'] = entity.niceShareDate;
  data['origin'] = entity.origin;
  data['prefix'] = entity.prefix;
  data['projectLink'] = entity.projectLink;
  data['publishTime'] = entity.publishTime;
  data['realSuperChapterId'] = entity.realSuperChapterId;
  data['selfVisible'] = entity.selfVisible;
  data['shareDate'] = entity.shareDate;
  data['shareUser'] = entity.shareUser;
  data['superChapterId'] = entity.superChapterId;
  data['superChapterName'] = entity.superChapterName;
  data['tags'] = entity.tags;
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['userId'] = entity.userId;
  data['visible'] = entity.visible;
  data['zan'] = entity.zan;
  return data;
}

extension ArticleItemDataDatasExtension on ArticleItemDataDatas {
  ArticleItemDataDatas copyWith({
    bool? adminAdd,
    String? apkLink,
    int? audit,
    String? author,
    bool? canEdit,
    int? chapterId,
    String? chapterName,
    bool? collect,
    int? courseId,
    String? desc,
    String? descMd,
    String? envelopePic,
    bool? fresh,
    String? host,
    int? id,
    bool? isAdminAdd,
    String? link,
    String? niceDate,
    String? niceShareDate,
    String? origin,
    String? prefix,
    String? projectLink,
    int? publishTime,
    int? realSuperChapterId,
    int? selfVisible,
    int? shareDate,
    String? shareUser,
    int? superChapterId,
    String? superChapterName,
    List<dynamic>? tags,
    String? title,
    int? type,
    int? userId,
    int? visible,
    int? zan,
  }) {
    return ArticleItemDataDatas()
      ..adminAdd = adminAdd ?? this.adminAdd
      ..apkLink = apkLink ?? this.apkLink
      ..audit = audit ?? this.audit
      ..author = author ?? this.author
      ..canEdit = canEdit ?? this.canEdit
      ..chapterId = chapterId ?? this.chapterId
      ..chapterName = chapterName ?? this.chapterName
      ..collect = collect ?? this.collect
      ..courseId = courseId ?? this.courseId
      ..desc = desc ?? this.desc
      ..descMd = descMd ?? this.descMd
      ..envelopePic = envelopePic ?? this.envelopePic
      ..fresh = fresh ?? this.fresh
      ..host = host ?? this.host
      ..id = id ?? this.id
      ..isAdminAdd = isAdminAdd ?? this.isAdminAdd
      ..link = link ?? this.link
      ..niceDate = niceDate ?? this.niceDate
      ..niceShareDate = niceShareDate ?? this.niceShareDate
      ..origin = origin ?? this.origin
      ..prefix = prefix ?? this.prefix
      ..projectLink = projectLink ?? this.projectLink
      ..publishTime = publishTime ?? this.publishTime
      ..realSuperChapterId = realSuperChapterId ?? this.realSuperChapterId
      ..selfVisible = selfVisible ?? this.selfVisible
      ..shareDate = shareDate ?? this.shareDate
      ..shareUser = shareUser ?? this.shareUser
      ..superChapterId = superChapterId ?? this.superChapterId
      ..superChapterName = superChapterName ?? this.superChapterName
      ..tags = tags ?? this.tags
      ..title = title ?? this.title
      ..type = type ?? this.type
      ..userId = userId ?? this.userId
      ..visible = visible ?? this.visible
      ..zan = zan ?? this.zan;
  }
}