import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/helpers/app_constants.dart';
import 'router/app_router.dart';
import 'router/app_routes.dart';
import 'theme/app_theme.dart';
import 'viewmodels/article_detail_view_model.dart';
import 'viewmodels/article_list_view_model.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/request_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ArticleListViewModel()),
        ChangeNotifierProvider(create: (_) => ArticleDetailViewModel()),
        ChangeNotifierProvider(create: (_) => RequestViewModel()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
