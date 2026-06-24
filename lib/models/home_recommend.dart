class HomeRecommend {
  const HomeRecommend({
    required this.pageNo,
    required this.pageSize,
    required this.pages,
    required this.records,
    required this.total,
  });

  final String? pageNo;
  final String? pageSize;
  final String? pages;
  final List<UserRecord> records;
  final String? total;

  factory HomeRecommend.fromJson(Map<String, dynamic> json) {
    final recordsJson = json['records'];
    return HomeRecommend(
      pageNo: json['pageNo'] as String?,
      pageSize: json['pageSize'] as String?,
      pages: json['pages'] as String?,
      total: json['total'] as String?,
      records: recordsJson is List
          ? recordsJson.whereType<Map<String, dynamic>>().map(UserRecord.fromJson).toList()
          : <UserRecord>[],
    );
  }
}

class UserRecord {
  const UserRecord({
    required this.accompanyLevel,
    required this.avatar,
    required this.categoryId,
    required this.categoryName,
    required this.coverImage,
    required this.level,
    required this.nickName,
    required this.orderAmount,
    required this.scoreAvg,
    required this.sex,
    required this.userId,
    required this.onlineFlag,
  });

  final int? accompanyLevel;
  final String avatar;
  final String categoryId;
  final String categoryName;
  final String coverImage;
  final int level;
  final String nickName;
  final int orderAmount;
  final int scoreAvg;
  final String sex;
  final String userId;
  final int onlineFlag;

  factory UserRecord.fromJson(Map<String, dynamic> json) {
    return UserRecord(
      accompanyLevel: (json['accompanyLevel'] as num?)?.toInt(),
      avatar: json['avatar']?.toString() ?? '',
      categoryId: json['categoryId']?.toString() ?? '',
      categoryName: json['categoryName']?.toString() ?? '',
      coverImage: json['coverImage']?.toString() ?? '',
      level: (json['level'] as num?)?.toInt() ?? 0,
      nickName: json['nickName']?.toString() ?? '',
      orderAmount: (json['orderAmount'] as num?)?.toInt() ?? 0,
      scoreAvg: (json['scoreAvg'] as num?)?.toInt() ?? 0,
      sex: json['sex']?.toString() ?? '',
      userId: json['userId']?.toString() ?? '',
      onlineFlag: (json['onlineFlag'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    //return super.toString();
    return 'UserRecord(categoryId: $categoryId, userId: $userId)';
  }
}
