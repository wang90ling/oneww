import '../models/app_user.dart';
import '../models/todo_item.dart';
import '../repositories/request_repository.dart';

class RequestService {
  RequestService({RequestRepository? repository})
      : _repository = repository ?? RequestRepository();

  final RequestRepository _repository;

  Future<List<TodoItem>> loadTodos() {
    return _repository.fetchTodos();
  }

  Future<List<AppUser>> loadUsers() {
    return _repository.fetchUsers();
  }
}
