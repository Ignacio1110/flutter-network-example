import 'package:flutter/material.dart';
import 'package:flutter_network_example/api/student.dart';
import 'package:flutter_network_example/pages/sencond_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'pages/home_page.dart';

final logger = Logger();

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

StateProvider<Student?> studentProvider = StateProvider((ref) => null);
StateProvider<String> studentIdPovider = StateProvider((ref) => "");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        "/second_page": (ctx) => const SecondPage(),
      },
    );
  }
}
