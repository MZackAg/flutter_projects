import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/routes.dart';
import 'package:flutter_projects/views/home_page_view.dart';
import 'package:flutter_projects/views/launches_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        launcheListRoute: (context) => const LauchesList(),
      },
      home: const MyHomePage(),
    );
  }
}
