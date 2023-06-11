import 'package:flutter/cupertino.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static Future? intentWithData(String routeName, Object arguments) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static Future? intent(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  static Future? intentAndRemove(String routeName) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  static Future? intentAndRemoveWithData(String routeName, Object arguments) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  static back<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }
}

