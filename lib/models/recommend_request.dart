class RecommendRequest {
  const RecommendRequest({
    required this.pageNo,
    required this.pageSize,
    required this.categoryId,
    this.sex,
    this.accompanyStandard,
  });

  final int? pageNo;
  final int? pageSize;
  final String? categoryId;
  final String? sex;
  final String? accompanyStandard;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pageNo': pageNo,
      'pageSize': pageSize,
      'categoryId': categoryId,
      'sex': sex,
      'accompanyStandard': accompanyStandard,
    };
  }
}
