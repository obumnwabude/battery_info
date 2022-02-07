import 'package:flutter/material.dart';
import 'heading.dart';

class Loader extends StatelessWidget {
  final String title;
  const Loader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      children: [
        Heading(title),
        const SizedBox(height: 96),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 128,
              height: 128,
              child: CircularProgressIndicator(strokeWidth: 10),
            ),
          ],
        ),
      ],
    );
  }
}
