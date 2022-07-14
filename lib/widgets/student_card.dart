import 'package:flutter/material.dart';
import 'package:flutter_network_example/api/student.dart';
import 'package:flutter_network_example/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudenCard extends StatelessWidget {
  const StudenCard({Key? key, required this.student}) : super(key: key);
  final Student student;
  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints(minWidth: 100, minHeight: 100),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 117, 151, 224),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/mona_lisa.jpeg"),
            radius: 80.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text('${student.name}')
        ],
      ),
    );
  }
}
