import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Prediction"),
      ),
      body: Center(child: Text(value, style: const TextStyle(fontSize: 24.0))),
    );
  }
}
