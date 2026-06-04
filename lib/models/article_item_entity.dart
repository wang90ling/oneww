import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/article_item_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/article_item_entity.g.dart';

@JsonSerializable()
class ArticleItemEntity {
	late ArticleItemData data;
	late int errorCode;
	late String errorMsg;

	ArticleItemEntity();

	factory ArticleItemEntity.fromJson(Map<String, dynamic> json) => $ArticleItemEntityFromJson(json);

	Map<String, dynamic> toJson() => $ArticleItemEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ArticleItemData {
	late int curPage;
	late List<ArticleItemDataDatas> datas;
	late int offset;
	late bool over;
	late int pageCount;
	late int size;
	late int total;

	ArticleItemData();

	factory ArticleItemData.fromJson(Map<String, dynamic> json) => $ArticleItemDataFromJson(json);

	Map<String, dynamic> toJson() => $ArticleItemDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ArticleItemDataDatas {
	late bool adminAdd;
	late String apkLink;
	late int audit;
	late String author;
	late bool canEdit;
	late int chapterId;
	late String chapterName;
	late bool collect;
	late int courseId;
	late String desc;
	late String descMd;
	late String envelopePic;
	late bool fresh;
	late String host;
	late int id;
	late bool isAdminAdd;
	late String link;
	late String niceDate;
	late String niceShareDate;
	late String origin;
	late String prefix;
	late String projectLink;
	late int publishTime;
	late int realSuperChapterId;
	late int selfVisible;
	late int shareDate;
	late String shareUser;
	late int superChapterId;
	late String superChapterName;
	late List<dynamic> tags;
	late String title;
	late int type;
	late int userId;
	late int visible;
	late int zan;

	ArticleItemDataDatas();

	factory ArticleItemDataDatas.fromJson(Map<String, dynamic> json) => $ArticleItemDataDatasFromJson(json);

	Map<String, dynamic> toJson() => $ArticleItemDataDatasToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}