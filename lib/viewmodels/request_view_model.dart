import 'package:flutter/foundation.dart';

import '../models/app_user.dart';
import '../models/todo_item.dart';
import '../services/request_service.dart';
import 'view_state.dart';

class RequestViewModel extends ChangeNotifier {
  RequestViewModel({RequestService? service}) : _service = service ?? RequestService();

  final RequestService _service;

  ViewStatus _status = ViewStatus.initial;
  String? _errorMessage;
  List<TodoItem> _todos = [];
  List<AppUser> _users = [];

  ViewStatus get status => _status;
  String? get errorMessage => _errorMessage;
  List<TodoItem> get todos => List.unmodifiable(_todos);
  List<AppUser> get users => List.unmodifiable(_users);

  Future<void> loadBundles() async {
    _status = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _todos = await _service.loadTodos();
      _users = await _service.loadUsers();
      _status = _todos.isEmpty && _users.isEmpty ? ViewStatus.empty : ViewStatus.success;
      notifyListeners();
    } catch (error) {
      _errorMessage = error.toString();
      _status = ViewStatus.error;
      notifyListeners();
    }
  }
}
