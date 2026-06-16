import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/app_user.dart';
import '../../models/home_category_item.dart';
import '../../models/home_recommend.dart';
import '../../models/new_circle_request.dart';
import '../../models/play_room_response_entity.dart';
import '../../models/playroom_by_hot_request.dart';
import '../../models/post_list_response_entity.dart';
import '../../models/recommend_request.dart';
import '../../models/todo_item.dart';
import '../../models/wan_article_entity.dart';
import '../../utils/network_endpoints.dart';
import '../helpers/app_logger.dart';
import '../helpers/auth_storage.dart';
import 'network_client.dart';

class ApiService {
  ApiService({NetworkClient? client}) : _client = client ?? NetworkClient();

  final NetworkClient _client;

  Future<List<TodoItem>> fetchTodoItems() async {
    final uri = Uri.parse('${NetworkEndpoints.baseUrl}${NetworkEndpoints.todos}');
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
    final uri = Uri.parse('${NetworkEndpoints.baseUrl}${NetworkEndpoints.users}');
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
    final uri = Uri.parse('${NetworkEndpoints.wanAndroidBaseUrl}${NetworkEndpoints.articleList(page)}');
    AppLogger.info('请求文章列表: $uri', tag: 'ApiService');

    final response = await http.get(uri);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final dynamic decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return WanArticleResponse.fromJson(decoded);
      }
      throw Exception('Invalid response format');
    }
    throw http.ClientException('Request failed with status ${response.statusCode}', response.request?.url);
  }

  Future<Map<String, dynamic>> sendTelephoneCode({
    required String phoneCountryCode,
    required String telephone,
    required String ticket,
    required String randStr,
  }) async {
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.sendTelephoneNew}').replace(
      queryParameters: <String, String>{
        'phoneCountryCode': phoneCountryCode,
        'telephone': telephone,
        'ticket': ticket,
        'randStr': randStr,
      },
    );

    AppLogger.info('请求短信验证码: $uri', tag: 'ApiService');
    return await _client.getJson(uri, headers: const <String, String>{'Accept': '*/*'});
  }

  Future<Map<String, dynamic>> loginByCode({
    required String phoneCountryCode,
    required String telephone,
    required String code,
  }) async {
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.loginCode}');
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

  Future<List<HomeCategoryItem>> getCategoryList() async {
    final token = await _resolveToken();
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.getCategoryList}');
    final response = await _client.getJson(uri, headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-device': 'APP',
      if (token != null && token.isNotEmpty) 'authorization': token,
    });

    final data = response['data'];
    if (data is List) {
      return data.whereType<Map<String, dynamic>>().map(HomeCategoryItem.fromJson).toList();
    }
    return <HomeCategoryItem>[];
  }

  Future<String?> _resolveToken() async {
    final token = await AuthStorage.getToken();
    if (token == null || token.isEmpty) return null;
    return token.startsWith('Bearer ') ? token : 'Bearer $token';
  }

  Future<HomeRecommend> getRecommendList(RecommendRequest req) async {
    final token = await _resolveToken();
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}/homePage/accompanyRecommendList');
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
    if (data is Map<String, dynamic>) return HomeRecommend.fromJson(data);
    return const HomeRecommend(pageNo: '1', pageSize: '20', pages: '0', records: <UserRecord>[], total: '0');
  }

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
        data: data.whereType<Map<String, dynamic>>().map(PostListResponseData.fromJson).toList(),
      );
    }

    return PostListResponseEntity(data: <PostListResponseData>[]);
  }

  Future<PlayRoomResponseEntity> getPlayRoomByHot(PlayroomByHotRequest req) async {
    final token = await _resolveToken();
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}/roomInfo/findPageHot');
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
        pageData.records = pageData.records
            .map((item) {
          item.roomName = _sanitizeText(item.roomName);
          item.moduleName = _sanitizeText(item.moduleName);
          item.mainLabel = _sanitizeText(item.mainLabel);
          item.userName = _sanitizeText(item.userName);
          item.otherValue = _sanitizeText(item.otherValue);
          item.announcement = _sanitizeText(item.announcement);
          item.welcomeMsg = _sanitizeText(item.welcomeMsg);
          item.heatValueStr = _sanitizeText(item.heatValueStr);
          return item;
        })
            .toList();

        return PlayRoomResponseEntity(data: pageData);
      }

      if (data is List) {
        return PlayRoomResponseEntity(
          data: PlayRoomResponseData()
            ..records = data.whereType<Map<String, dynamic>>().map(PlayRoomResponseDataRecords.fromJson).toList(),
        );
      }

      return PlayRoomResponseEntity(data: PlayRoomResponseData());
    } catch (error, stackTrace) {
      AppLogger.error('热门直播房间接口失败: $uri', error: error, stackTrace: stackTrace, tag: 'ApiService');
      return PlayRoomResponseEntity(data: PlayRoomResponseData());
    }
  }

  static String? _sanitizeText(String? value) {
    if (value == null) return null;
    return value.replaceAll('\u0000', '').trim();
  }
}
