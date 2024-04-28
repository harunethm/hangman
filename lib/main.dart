import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/routes/routes.dart';
import 'package:hangman/views/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.fallback(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
        ),
      ),
      enableLog: kDebugMode,
      routes: Routes.routes,
      initialRoute: HomeView.routeName,
    );
  }
}
