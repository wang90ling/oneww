import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/app_user.dart';
import '../../models/home_category_item.dart';
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

  Future<String?> _resolveToken() async {
    final token = await AuthStorage.getToken();
    if (token == null || token.isEmpty) {
      return null;
    }
    return token.startsWith('Bearer ') ? token : 'Bearer $token';
  }
}
