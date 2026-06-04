import 'package:oneww/core/network/network_client.dart';
import 'package:oneww/models/app_user.dart';
import 'package:oneww/models/todo_item.dart';
import '../utils/network_endpoints.dart';

class ApiService {
  ApiService({NetworkClient? client}) : _client = client ?? NetworkClient();

  final NetworkClient _client;

  Future<List<TodoItem>> fetchTodoItems() async {
    final uri = Uri.parse('${NetworkEndpoints.baseUrl}${NetworkEndpoints.todos}');
    final data = await _client.getList(uri);

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
}
