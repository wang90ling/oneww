import '../core/network/api_service.dart';
import '../models/app_user.dart';
import '../models/todo_item.dart';

class RequestRepository {
  RequestRepository({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<List<TodoItem>> fetchTodos() {
    return _apiService.fetchTodoItems();
  }

  Future<List<AppUser>> fetchUsers() {
    return _apiService.fetchUsers();
  }
}
