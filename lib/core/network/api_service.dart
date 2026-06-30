import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/accompany_category_detail_entity.dart';
import '../../models/app_user.dart';
import '../../models/home_category_item.dart';
import '../../models/home_new_recommend_entity.dart';
import '../../models/home_recommend.dart';
import '../../models/new_circle_request.dart';
import '../../models/play_room_response_entity.dart';
import '../../models/playroom_by_hot_request.dart';
import '../../models/post_list_response_entity.dart';
import '../../models/query_dispatch_rooms_by_heat_request_entity.dart';
import '../../models/query_dispatch_rooms_by_heat_response_entity.dart';
import '../../models/recommend_request.dart';
import '../../models/todo_item.dart';
import '../../models/user_detail_response_entity.dart';
import '../../models/user_gift_wall_request_entity.dart';
import '../../models/user_gift_wall_response_entity.dart';
import '../../models/wan_article_entity.dart';
import '../../utils/network_endpoints.dart';
import '../helpers/app_logger.dart';
import '../helpers/auth_storage.dart';
import 'network_client.dart';

class ApiService {
  ApiService({NetworkClient? client}) : _client = client ?? NetworkClient();

  final NetworkClient _client;

  Future<List<TodoItem>> fetchTodoItems() async {
    final uri = Uri.parse(
      '${NetworkEndpoints.baseUrl}${NetworkEndpoints.todos}',
    );
    final data = await _client.getList(uri);
    AppLogger.info('data:$data', tag: 'wangling');

    return data.map((item) {
      final map = item as Map<String, dynamic>;
      return TodoItem(
        title: map['title']?.toString() ?? 'Untitled',
        done: map['completed'] == true,
      );
    }).toList();
  }

  Future<List<AppUser>> fetchUsers() async {
    final uri = Uri.parse(
      '${NetworkEndpoints.baseUrl}${NetworkEndpoints.users}',
    );
    AppLogger.info('baseUrl:${uri.path}', tag: 'ApiService wangling');
    final data = await _client.getList(uri);

    return data.map((item) {
      final map = item as Map<String, dynamic>;
      return AppUser(
        name: map['name']?.toString() ?? 'Unknown',
        title: map['company']?['name']?.toString() ?? 'No title',
        avatarUrl: '',
      );
    }).toList();
  }

  Future<WanArticleResponse> fetchWanArticles(int page) async {
    final uri = Uri.parse(
      '${NetworkEndpoints.wanAndroidBaseUrl}${NetworkEndpoints.articleList(page)}',
    );
    AppLogger.info('请求文章列表: $uri', tag: 'ApiService');

    final response = await http.get(uri);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final dynamic decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return WanArticleResponse.fromJson(decoded);
      }
      throw Exception('Invalid response format');
    }
    throw http.ClientException(
      'Request failed with status ${response.statusCode}',
      response.request?.url,
    );
  }

  ///发送验证码
  Future<Map<String, dynamic>> sendTelephoneCode({
    required String phoneCountryCode,
    required String telephone,
    required String ticket,
    required String randStr,
  }) async {
    final uri =
        Uri.parse(
          '${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.sendTelephoneNew}',
        ).replace(
          queryParameters: <String, String>{
            'phoneCountryCode': phoneCountryCode,
            'telephone': telephone,
            'ticket': ticket,
            'randStr': randStr,
          },
        );

    AppLogger.info('请求短信验证码: $uri', tag: 'ApiService');
    return await _client.getJson(
      uri,
      headers: const <String, String>{'Accept': '*/*'},
    );
  }

  ///通过验证码登录
  Future<Map<String, dynamic>> loginByCode({
    required String phoneCountryCode,
    required String telephone,
    required String code,
  }) async {
    final uri = Uri.parse(
      '${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.loginCode}',
    );
    AppLogger.info('验证码登录: $uri', tag: 'ApiService');

    return await _client.postJson(
      uri,
      headers: const <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-device': 'APP',
      },
      body: <String, dynamic>{
        'phoneCountryCode': phoneCountryCode,
        'telephone': telephone,
        'code': code,
        'password': '',
      },
    );
  }

  ///获取种类列表显示
  Future<List<HomeCategoryItem>> getCategoryList() async {
    final token = await _resolveToken();
    final uri = Uri.parse(
      '${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.getCategoryList}',
    );
    final response = await _client.getJson(
      uri,
      headers: _buildAppHeaders(token),
    );

    final data = response['data'];
    if (data is List) {
      return data
          .whereType<Map<String, dynamic>>()
          .map(HomeCategoryItem.fromJson)
          .toList();
    }
    return <HomeCategoryItem>[];
  }

  Future<String?> _resolveToken() async {
    final token = await AuthStorage.getToken();
    if (token == null || token.isEmpty) return null;
    return token.startsWith('Bearer ') ? token : '$token';
  }

  Map<String, String> _buildAppHeaders(String? token) {
    return <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-device': 'APP',
      if (token != null && token.isNotEmpty) 'authorization': token,
    };
  }

  ///推荐列表显示
  Future<HomeNewRecommendEntity> getRecommendList(RecommendRequest req) async {
    final token = await _resolveToken();
    final uri = Uri.parse(
      '${NetworkEndpoints.appBaseUrl}/homePage/accompanyRecommendList',
    );
    final response = await _client.postJson(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-device': 'APP',
        if (token != null && token.isNotEmpty) 'authorization': token,
      },
      body: req.toJson(),
    );

    final data = response['data'];
    if (data is Map<String, dynamic>) {
      final records = data['records'];
      if (records is List && records.isNotEmpty) {
        AppLogger.info('推荐列表第一条原始数据: ${records.first}', tag: 'wangling');
      }
      return HomeNewRecommendEntity.fromJson(response);
    }

    final fallback = HomeNewRecommendEntity()
      ..data = HomeNewRecommendData()
      ..data.pageNo = 1
      ..data.pageSize = 20
      ..data.pages = 0
      ..data.total = 0
      ..data.records = <HomeNewRecommendDataRecords>[];
    return fallback;
  }

  ///圈子列表显示
  Future<PostListResponseEntity> getNewPostList(NewCircleRequest req) async {
    final token = await _resolveToken();
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}/post/newPostList');
    final response = await _client.postJson(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-device': 'APP',
        if (token != null && token.isNotEmpty) 'authorization': token,
      },
      body: req.toJson(),
    );

    final data = response['data'];
    if (data is Map<String, dynamic>) {
      final entity = PostListResponseEntity.fromJson(data);
      entity.data = entity.data ?? <PostListResponseData>[];
      return entity;
    }

    if (data is List) {
      return PostListResponseEntity(
        data: data
            .whereType<Map<String, dynamic>>()
            .map(PostListResponseData.fromJson)
            .toList(),
      );
    }

    return PostListResponseEntity(data: <PostListResponseData>[]);
  }

  ///热门房间列表
  Future<PlayRoomResponseEntity> getPlayRoomByHot(
    PlayroomByHotRequest req,
  ) async {
    final token = await _resolveToken();
    final uri = Uri.parse(
      '${NetworkEndpoints.appBaseUrl}/roomInfo/findPageHot',
    );
    AppLogger.info('热门直播房间: $uri, body: ${req.toJson()}', tag: 'ApiService');

    try {
      final response = await _client.postJson(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-device': 'APP',
          if (token != null && token.isNotEmpty) 'authorization': token,
        },
        body: req.toJson(),
      );

      final data = response['data'];

      if (data is Map<String, dynamic>) {
        final pageData = PlayRoomResponseData.fromJson(data);
        pageData.records = pageData.records.map((item) {
          item.roomName = _sanitizeText(item.roomName);
          item.moduleName = _sanitizeText(item.moduleName);
          item.mainLabel = _sanitizeText(item.mainLabel);
          item.userName = _sanitizeText(item.userName);
          item.otherValue = _sanitizeText(item.otherValue);
          item.announcement = _sanitizeText(item.announcement);
          item.welcomeMsg = _sanitizeText(item.welcomeMsg);
          item.heatValueStr = _sanitizeText(item.heatValueStr);
          return item;
        }).toList();

        return PlayRoomResponseEntity(data: pageData);
      }

      if (data is List) {
        return PlayRoomResponseEntity(
          data: PlayRoomResponseData()
            ..records = data
                .whereType<Map<String, dynamic>>()
                .map(PlayRoomResponseDataRecords.fromJson)
                .toList(),
        );
      }

      return PlayRoomResponseEntity(data: PlayRoomResponseData());
    } catch (error, stackTrace) {
      AppLogger.error(
        '热门直播房间接口失败: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      return PlayRoomResponseEntity(data: PlayRoomResponseData());
    }
  }

  ///搭子详情接口对接
  Future<List<HomeCategoryItem>> getAccompanyDetailInfo(String userId) async {
    final token = await _resolveToken();
    final uri = Uri.parse(
      '${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.getDetailInfo}' +
          userId,
    );
    final response = await _client.getJson(
      uri,
      headers: _buildAppHeaders(token),
    );

    final data = response['data'];
    AppLogger.info(
      'getAccompanyDetailInfo data:' + data.toString(),
      tag: 'wangling',
    );
    if (data is List) {
      return data
          .whereType<Map<String, dynamic>>()
          .map(HomeCategoryItem.fromJson)
          .toList();
    }
    return <HomeCategoryItem>[];
  }

  ///搭子详情接口对接
  Future<AccompanyCategoryDetailEntity> getAccompanyCategoryDetail(
    String categoryId,
    String userId,
  ) async {
    final token = await _resolveToken();
    AppLogger.info(
      'getAccompanyCategoryDetail - Token检查: ${token ?? "null"}',
      tag: 'wangling',
    );

    final uri =
        Uri.parse(
          '${NetworkEndpoints.appBaseUrl}/accompany/accompanyCategoryDetail',
        ).replace(
          queryParameters: <String, String>{
            'categoryId': categoryId,
            'userId': userId,
          },
        );

    AppLogger.info(
      'getAccompanyCategoryDetail - 请求Headers: ${_buildAppHeaders(token)}',
      tag: 'wangling',
    );
    final response = await _client.getJson(
      uri,
      headers: _buildAppHeaders(token),
    );

    final data = response['data'];
    AppLogger.info('getAccompanyCategoryDetail data:$data', tag: 'wangling');
    if (data is Map<String, dynamic>) {
      return AccompanyCategoryDetailEntity.fromJson(response);
    }
    throw const FormatException('Invalid accompany category detail response');
  }

  ///派单大厅接口对接
  Future<QueryDispatchRoomsByHeatResponseEntity> queryDispatchRoomsByHeat(
    QueryDispatchRoomsByHeatRequestEntity req,
  ) async {
    final token = await _resolveToken();
    final uri = Uri.parse(
      '${NetworkEndpoints.appBaseUrl}/channelRoom/queryDispatchRoomsByHeat',
    );
    AppLogger.info('派单厅列表: $uri, body: ${req.toJson()}', tag: 'ApiService');
    final response = await _client.postJson(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-device': 'APP',
        if (token != null && token.isNotEmpty) 'authorization': token,
      },
      body: req.toJson(),
    );

    final data = response['data'];
    if (data is Map<String, dynamic>) {
      final records = data['records'];
      if (records is List && records.isNotEmpty) {
        AppLogger.info('派单厅第一条原始数据: ${records.first}', tag: 'wangling');
      }
      return QueryDispatchRoomsByHeatResponseEntity.fromJson(response);
    }

    final fallback = QueryDispatchRoomsByHeatResponseEntity()
      ..data = QueryDispatchRoomsByHeatResponseData()
      ..data.pageNo = 1
      ..data.pageSize = 20
      ..data.pages = 0
      ..data.total = 0
      ..data.records = <QueryDispatchRoomsByHeatResponseDataRecords>[];
    return fallback;
  }


  //我的模块，用户信息接口对接
  Future<UserDetailResponseEntity> getUserInfo() async {
    final token = await _resolveToken();
    final uri = Uri.parse(
      '${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.getUserInfo}',
    );
    final response = await _client.getJson(
      uri,
      headers: _buildAppHeaders(token),
    );

    final data = response['data'];
    AppLogger.info('getAccompanyCategoryDetail data:$data', tag: 'wangling');
    if (data is Map<String, dynamic>) {
      return UserDetailResponseEntity.fromJson(response);
    }
    throw const FormatException('Invalid accompany category detail response');
  }


  ///指定用户的礼物墙
  Future<UserGiftWallResponseEntity> giftUserGiftWall(
      UserGiftWallRequestEntity req,
      ) async {
    final token = await _resolveToken();
    final uri = Uri.parse(
      '${NetworkEndpoints.appBaseUrl}/gift/userGiftWall',
    );
    AppLogger.info('指定用户的礼物墙: $uri, body: ${req.toJson()}', tag: 'ApiService');
    final response = await _client.postJson(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-device': 'APP',
        if (token != null && token.isNotEmpty) 'authorization': token,
      },
      body: req.toJson(),
    );

    final data = response['data'];
    if (data is Map<String, dynamic>) {
      final records = data['records'];
      if (records is List && records.isNotEmpty) {
        AppLogger.info('指定用户的礼物墙第一条原始数据: ${records.first}', tag: 'wangling');
      }
      return UserGiftWallResponseEntity.fromJson(response);
    }

    final fallback = UserGiftWallResponseEntity()
      ..data = UserGiftWallResponseData()
      ..data.pageNo = 1
      ..data.pageSize = 20
      ..data.pages = 0
      ..data.total = 0
      ..data.records = <UserGiftWallResponseDataRecords>[];
    return fallback;
  }


  static String? _sanitizeText(String? value) {
    if (value == null) return null;
    return value.replaceAll('\u0000', '').trim();
  }
}
