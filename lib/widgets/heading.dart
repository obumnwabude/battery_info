import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'BATTERY SAVER',
      style: TextStyle(fontSize: 32),
      textAlign: TextAlign.center,
    );
  }
}
