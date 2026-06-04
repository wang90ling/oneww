import 'package:flutter/material.dart';

import '../pages/articles/article_detail_page.dart';
import '../pages/articles/article_list_page.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/request/request_demo_page.dart';
import '../pages/shell/app_shell_page.dart';
import '../pages/todo/todo_page.dart';
import '../pages/webview/webview_page.dart';
import '../core/helpers/auth_storage.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const AppShellPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.articleList:
        return MaterialPageRoute(builder: (_) => const _AuthGuardPage(child: ArticleListPage()));
      case AppRoutes.articleDetail:
        final articleId = settings.arguments is int ? settings.arguments as int : 1;
        return MaterialPageRoute(
          builder: (_) => _AuthGuardPage(child: ArticleDetailPage(articleId: articleId)),
        );
      case AppRoutes.webView:
        final args = settings.arguments as Map<String, String?>?;
        return MaterialPageRoute(
          builder: (_) => _AuthGuardPage(
            child: WebViewPage(
              url: args?['url'] ?? '',
              title: args?['title'],
            ),
          ),
        );
      case AppRoutes.requestDemo:
        return MaterialPageRoute(builder: (_) => const _AuthGuardPage(child: RequestDemoPage()));
      case AppRoutes.todo:
        return MaterialPageRoute(builder: (_) => const _AuthGuardPage(child: TodoPage()));
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const _AuthGuardPage(child: ProfilePage()));
      default:
        return MaterialPageRoute(builder: (_) => const AppShellPage());
    }
  }
}

class _AuthGuardPage extends StatelessWidget {
  const _AuthGuardPage({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AuthStorage.hasToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.data != true) {
          return const LoginPage();
        }

        return child;
      },
    );
  }
}
