import 'package:bloc_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter app",
        theme: ThemeData(primarySwatch: Colors.cyan),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
