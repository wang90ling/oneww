import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    super.key,
    required this.url,
    this.title,
  });

  final String url;
  final String? title;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;
  bool _isLoading = true;
  String? _pageTitle;
  bool _platformReady = false;

  @override
  void initState() {
    super.initState();
    _ensurePlatformInitialized();
  }

  Future<void> _ensurePlatformInitialized() async {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      // 等待平台通道初始化
      await Future.delayed(const Duration(milliseconds: 50));
    }
    setState(() {
      _platformReady = true;
    });
    _initController();
  }

  void _initController() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) async {
            final title = await _controller.getTitle();
            setState(() {
              _isLoading = false;
              _pageTitle = title;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<bool> _handlePop() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false;
    }
    return true;
  }

  void _handleBackPressed() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
    } else {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (!didPop) {
          await _handlePop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pageTitle ?? widget.title ?? '网页'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _handleBackPressed,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _controller.reload();
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            if (_platformReady)
              WebViewWidget(controller: _controller),
            if (!_platformReady || _isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
