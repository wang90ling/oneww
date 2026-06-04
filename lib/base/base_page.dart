import 'package:flutter/material.dart';

import '../core/widgets/loading_view.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({super.key});

  String get pageTitle;
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  bool isLoading = false;
  String? errorMessage;

  @protected
  Widget buildPage(BuildContext context);

  @protected
  Future<void> onPageReady() async {}

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onPageReady();
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = buildPage(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.pageTitle)),
      body: Stack(
        children: [
          body,
          if (isLoading) const Positioned.fill(child: LoadingView()),
          if (errorMessage != null)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
