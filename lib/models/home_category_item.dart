class HomeCategoryItem {
  const HomeCategoryItem({
    required this.id,
    required this.categoryName,
    required this.categoryType,
    required this.fileUrl,
    required this.backgroundFileUrl,
    required this.compensationInfo,
    required this.weighted,
    required this.coverImageUrl,
    required this.sampleImageUrl,
  });

  final String id;
  final String categoryName;
  final String categoryType;
  final String fileUrl;
  final String backgroundFileUrl;
  final String compensationInfo;
  final int weighted;
  final String coverImageUrl;
  final String sampleImageUrl;

  factory HomeCategoryItem.fromJson(Map<String, dynamic> json) {
    return HomeCategoryItem(
      id: json['id']?.toString() ?? '0',
      categoryName: json['categoryName']?.toString() ?? '',
      categoryType: json['categoryType']?.toString() ?? '',
      fileUrl: json['fileUrl']?.toString() ?? '',
      backgroundFileUrl: json['backgroundFileUrl']?.toString() ?? '',
      compensationInfo: json['compensationInfo']?.toString() ?? '',
      weighted: (json['weighted'] as num?)?.toInt() ?? 0,
      coverImageUrl: json['coverImageUrl']?.toString() ?? '',
      sampleImageUrl: json['sampleImageUrl']?.toString() ?? '',
    );
  }
}
