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
    AppLogger.info("data:" + data.toString(), tag: "wangling");

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
    AppLogger.info(
      'baseUrl:' + uri.path,
      tag: 'ApiService wangling',
    );
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

    try {
      final response = await http.get(uri);
      AppLogger.info('response: $response', tag: 'ApiService');

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
    } catch (error, stackTrace) {
      AppLogger.error(
        '获取文章列表失败: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      rethrow;
    }
  }

  /// 发送验证码接口
  Future<Map<String, dynamic>> sendTelephoneCode({
    required String phoneCountryCode,
    required String telephone,
    required String ticket,
    required String randStr,
  }) async {
    final uri = Uri.parse(
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

    try {
      AppLogger.info("uri:" + uri.path, tag: "wangling");
      return await _client.getJson(
        uri,
        headers: const <String, String>{
          'Accept': '*/*',
        },
      );
    } catch (error, stackTrace) {
      AppLogger.error(
        '发送短信验证码失败: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      rethrow;
    }
  }

  /// 验证码登录接口
  Future<Map<String, dynamic>> loginByCode({
    required String phoneCountryCode,
    required String telephone,
    required String code,
  }) async {
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.loginCode}');

    AppLogger.info('验证码登录: $uri', tag: 'ApiService');

    try {
      return await _client.postJson(
        uri,
        headers: const <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-device': 'APP'
        },
        body: <String, dynamic>{
          'phoneCountryCode': phoneCountryCode,
          'telephone': telephone,
          'code': code,
          'password': '',
        },
      );
    } catch (error, stackTrace) {
      AppLogger.error(
        '验证码登录失败: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      rethrow;
    }
  }

  /// 获取首页游戏分类列表
  Future<List<HomeCategoryItem>> getCategoryList() async {
    final token = await _resolveToken();
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.getCategoryList}');

    AppLogger.info('获取首页游戏分类列表: $uri', tag: 'ApiService');

    try {
      final response = await _client.getJson(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-device': 'APP',
          if (token != null && token.isNotEmpty) 'authorization': token,
        },
      );

      final data = response['data'];
      if (data is List) {
        return data
            .whereType<Map<String, dynamic>>()
            .map(HomeCategoryItem.fromJson)
            .toList();
      }
      return <HomeCategoryItem>[];
    } catch (error, stackTrace) {
      AppLogger.error(
        '获取首页游戏分类列表失败: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      rethrow;
    }
  }

  //解析token
  Future<String?> _resolveToken() async {
    final token = await AuthStorage.getToken();
    if (token == null || token.isEmpty) {
      return null;
    }
    return token.startsWith('Bearer ') ? token : 'Bearer $token';
  }

  /// 根据游戏类别加载选中的陪玩列表
  /// getRecommendList 首页-推荐列表
  Future<HomeRecommend> getRecommendList(RecommendRequest req) async {
    final token = await _resolveToken();
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}/homePage/accompanyRecommendList');

    AppLogger.info('推荐列表: $uri, body: ${req.toJson()}', tag: 'ApiService');

    try {
      //post请求推荐列表
      final response = await _client.postJson(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-device': 'APP',
          if ( token != null && token.isNotEmpty) 'authorization': token,
        },
        body: req.toJson(),
      );

      final data = response['data'];
      if (data is Map<String, dynamic>) {
        return HomeRecommend.fromJson(data);
      }
      return const HomeRecommend(pageNo: "1", pageSize: "20", pages: "0", records: <UserRecord>[], total: "0");
    } on http.ClientException catch (error, stackTrace) {
      AppLogger.error(
        '推荐列表请求失败(客户端): $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      return const HomeRecommend(pageNo: "1", pageSize: "20", pages: "0", records: <UserRecord>[], total: "0");
    } catch (error, stackTrace) {
      AppLogger.error(
        '推荐列表: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      return const HomeRecommend(pageNo: "1", pageSize: "20", pages: "0", records: <UserRecord>[], total: "0");
    }
  }

  //加载圈子接口
  ///getNewPostList
  Future<PostListResponseEntity> getNewPostList(NewCircleRequest req) async {
    final token = await _resolveToken();
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}/post/newPostList');

    AppLogger.info('热门圈子: $uri, body: ${req.toJson()}', tag: 'ApiService');

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
    } catch (error, stackTrace) {
      AppLogger.error(
        '加载圈子接口失败: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      return PostListResponseEntity(data: <PostListResponseData>[]);
    }
  }

  ///查看热门房间列表
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
        final entity = PlayRoomResponseEntity.fromJson(data);
        entity.data = (entity.data ?? <PlayRoomResponseData>[]) as PlayRoomResponseData?;
        return entity;
      }

      if (data is List) {
        return PlayRoomResponseEntity(
          data: data
              .whereType<Map<String, dynamic>>()
              .map(PlayRoomResponseData.fromJson)
              .toList(),
        );
      }

      return PlayRoomResponseEntity(data: <PlayRoomResponseData>[]);
    } catch (error, stackTrace) {
      AppLogger.error(
        '热门直播房间接口失败: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      return PlayRoomResponseEntity(data: <PlayRoomResponseData>[]);
    }
  }


}
