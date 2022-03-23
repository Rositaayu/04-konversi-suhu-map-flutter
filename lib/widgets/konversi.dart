import 'package:flutter/material.dart';

class Konversi extends StatelessWidget {
  final konvertHandler;

  const Konversi({Key? key, required this.konvertHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: konvertHandler,
        color: Colors.orange,
        textColor: Colors.white,
        child: const Text("Konversi"),
      ),
    );
  }
}
