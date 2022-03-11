import 'package:flutter/material.dart';

class Konversi extends StatelessWidget {
  const Konversi({
    Key? key,
    required this.convertHandler,
  }) : super(key: key);

  final Function convertHandler;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        convertHandler();
      },
      child: const Text(
        "Konversi Suhu",
        style: const TextStyle(fontSize: 24),
      ),
      color: Colors.blue,
      textColor: Colors.white,
      minWidth: double.maxFinite,
      padding: const EdgeInsets.all(8),
      height: 50,
    );
  }
}
