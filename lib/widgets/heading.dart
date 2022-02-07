import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String _text;
  const Heading(this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text.toUpperCase(),
      style: const TextStyle(fontSize: 32),
      textAlign: TextAlign.center,
    );
  }
}
