import 'package:dragon_store/config/foundations/theme/app_theme.dart';
import 'package:dragon_store/config/router/app_router.dart';
import 'package:dragon_store/ui/providers/dragon_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DragonListProvider())],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
