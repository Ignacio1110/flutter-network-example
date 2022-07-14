import 'package:flutter/material.dart';
import 'package:flutter_network_example/main.dart';
import 'package:flutter_network_example/widgets/student_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/student.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('第二頁還能取到資料嗎？'),
            Consumer(builder: (context, ref, _) {
              final student =
                  ref.watch(studentProvider) ?? Student(name: "unknown");
              return StudenCard(student: student);
            }),
            Consumer(builder: (context, ref, child) {
              return TextButton(
                onPressed: () =>
                    ref.read(studentProvider.state).update((state) => null),
                child: const Text("清除"),
              );
            })
          ],
        ),
      ),
    );
  }
}
