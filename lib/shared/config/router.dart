import 'package:flutter/material.dart';

import '../../screens/splash/home_layout.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> router() {
    return {
      '/': (ctx) => const HomeScreen(),
      HomeScreen.routeName: (ctx) => const HomeScreen(),
    };
  }
}
