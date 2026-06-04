import 'package:flutter/foundation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _loading = false;
  String? _errorMessage;

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;

  @protected
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  @protected
  void setError(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  @protected
  Future<T> runWithLoading<T>(Future<T> Function() action) async {
    setLoading(true);
    setError(null);
    try {
      return await action();
    } catch (error) {
      setError(error.toString());
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
