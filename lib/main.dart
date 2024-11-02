import 'package:bloc_app/bloc/person_bloc.dart';
import 'package:bloc_app/pages/bloc_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home: BlocProvider(
            create: (_) => PersonsBloc(), child: const HomePage()));
  }
}
