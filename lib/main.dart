import 'package:flutter/material.dart';
import 'core/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aqary Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4B72A9)),
        useMaterial3: true,
      ),
      initialRoute: Routes.homeRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
