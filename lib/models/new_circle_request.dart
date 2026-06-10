///热门圈子请求类
class NewCircleRequest {
  const NewCircleRequest({
    required this.pageNo,
    required this.pageSize,
    required this.endTime,
    this.postId,
  });

  final int? pageNo;
  final int? pageSize;
  final String? endTime;
  final String? postId;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pageNo': pageNo,
      'pageSize': pageSize,
      'endTime': endTime,
      'postId': postId,
    };
  }
}
