import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'router/app_router.dart';

class PortfolioProMax extends StatelessWidget {
  const PortfolioProMax({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Moe Kyaw Aung — Pro Max',
      theme: AppTheme.dark(),
      routerConfig: AppRouter.router,
    );
  }
}
