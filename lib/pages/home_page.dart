import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_client.dart';
import '../api/student.dart';
import '../main.dart';
import '../widgets/student_card.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  //從雲端取得資料
  void _fetchData(String studentId, WidgetRef ref) {
    print("_fetchData for $studentId");
    final dio = Dio(); // Provide a dio instance
    dio.options.headers["Demo-Header"] =
        "demo header"; // config your dio headers globally
    final client = RestClient(dio);

    client.getTasks().then((it) {
      logger.i(it);
      ref.read(studentProvider.state).state = Student(name: "fetched");
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Student? student = ref.watch(studentProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (student != null)
              Center(
                child: StudenCard(
                  student: student,
                ),
              ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .5,
              child: TextField(
                onChanged: ((value) =>
                    ref.read(studentIdPovider.state).state = value),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final String studentId = ref.watch(studentIdPovider);
                _fetchData(studentId, ref);
              },
              child: const Text("取得資料"),
            ),
            const Text(
              'press button to fetch data',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/second_page");
              },
              child: const Text("下一頁"),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
