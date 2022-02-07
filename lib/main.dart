import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Battery Saver',
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          children: const [
            Text(
              'BATTERY SAVER',
              style: TextStyle(fontSize: 32),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            
          ],
        ),
      ),
    );
  }
}
