import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Battery Saver',
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          children: [
            const Text(
              'BATTERY SAVER',
              style: TextStyle(fontSize: 32),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 64,
                      height: 12,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1, color: _color),
                          left: BorderSide(width: 1, color: _color),
                          right: BorderSide(width: 1, color: _color),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 228,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: _color),
                      ),
                      child: Column(
                        children: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
                            .map((n) => [
                                  Container(
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: _color,
                                      border:
                                          Border.all(width: 1, color: _color),
                                    ),
                                  ),
                                  if (n != 1) const SizedBox(height: 6)
                                ])
                            .expand((w) => w)
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
