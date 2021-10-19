import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future? pushNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  Future? pushReplacementNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  void pop([dynamic object]) {
    return navigatorKey.currentState?.pop(object);
  }
}
