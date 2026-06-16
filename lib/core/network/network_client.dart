import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/app_logger.dart';

class NetworkClient {
  NetworkClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<Map<String, dynamic>> getJson(
      Uri uri, {
        Map<String, String>? headers,
      }) async {
    try {
      final response = await _client.get(uri, headers: headers);
      return _decodeMapResponse(response);
    } catch (error, stackTrace) {
      AppLogger.error(
        'GET request failed: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'NetworkClient',
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postJson(
      Uri uri, {
        Map<String, String>? headers,
        Object? body,
      }) async {
    try {
      final response = await _client.post(
        uri,
        headers: headers,
        body: body == null ? null : jsonEncode(body),
      );
      AppLogger.info('postJson response:'+response.body,tag: 'wangling');

      return _decodeMapResponse(response);
    } catch (error, stackTrace) {
      AppLogger.error(
        'POST request failed: $uri',
        error: error,
        stackTrace: stackTrace,
        tag: 'NetworkClient',
      );
      rethrow;
    }
  }

  Future<List<dynamic>> getList(
      Uri uri, {
        Map<String, String>? headers,
      }) async {
    final response = await getJson(uri, headers: headers);
    final data = response['data'];
    if (data is List) {
      return data;
    }
    return <dynamic>[];
  }

  Map<String, dynamic> _decodeMapResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final dynamic decoded = jsonDecode(utf8.decode(response.bodyBytes, allowMalformed: true));
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
      return <String, dynamic>{'data': decoded};
    }
    throw http.ClientException(
      'Request failed with status ${response.statusCode}',
      response.request?.url,
    );
  }

  void dispose() {
    _client.close();
  }
}
