import 'package:flutter/material.dart';

mixin BasePageState<T extends StatefulWidget> on State<T> {
  bool isLoading = false;
  String? errorMessage;

  void setLoading(bool value) {
    if (!mounted) return;
    setState(() {
      isLoading = value;
    });
  }

  void setError(String? value) {
    if (!mounted) return;
    setState(() {
      errorMessage = value;
    });
  }

  void clearError() {
    setError(null);
  }

  Future<void> runWithLoading(Future<void> Function() task) async {
    setLoading(true);
    clearError();
    try {
      await task();
    } catch (error) {
      setError(error.toString());
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
