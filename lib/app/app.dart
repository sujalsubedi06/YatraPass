import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/theme/app_theme.dart';
import 'router/app_router.dart';

class YatraPassApp extends ConsumerWidget {
  const YatraPassApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'YatraPass',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,

      // We will enable user-selectable theme after login.
      themeMode: ThemeMode.light,

      routerConfig: appRouter,
    );
  }
}