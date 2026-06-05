import 'package:flutter/material.dart';
import '../../features/shell/presentation/pages/portfolio_shell_page.dart';

class AppRouter {
  static final router = RouterConfig<Object>(
    routerDelegate: _SimpleDelegate(),
    routeInformationParser: _SimpleParser(),
  );
}

class _SimpleParser extends RouteInformationParser<Object> {
  @override
  Future<Object> parseRouteInformation(RouteInformation routeInformation) async => Object();
}

class _SimpleDelegate extends RouterDelegate<Object>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Object> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Object? get currentConfiguration => Object();

  @override
  Future<void> setNewRoutePath(Object configuration) async {}

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: const [MaterialPage(child: PortfolioShellPage())],
      onPopPage: (route, result) => route.didPop(result),
    );
  }
}
