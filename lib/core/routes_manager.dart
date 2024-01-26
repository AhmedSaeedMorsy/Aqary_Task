import 'package:flutter/material.dart';

import '../features/home_screen.dart';

class Routes {
  static const String homeRoute = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return unDefiendRoute();
    }
  }

  static Route<dynamic> unDefiendRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Not Found"),
        ),
        body: const Center(
          child: Text("Not Found"),
        ),
      ),
    );
  }
}
