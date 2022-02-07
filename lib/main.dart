import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_saver/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'widgets/battery.dart';
import 'widgets/loader.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Color _getColor(int level) => level > 75
      ? Colors.lightGreenAccent.shade400
      : level > 20
          ? Colors.yellowAccent
          : Colors.redAccent.shade700;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Battery Saver',
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: StreamBuilder<AndroidBatteryInfo?>(
            stream: BatteryInfoPlugin().androidBatteryInfoStream,
            builder: (context, snapshot) {
              if (snapshot.data == null) return const Loader();

              int _level = snapshot.data!.batteryLevel!;
              Color _color = _getColor(_level);
              return ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
                children: [
                  const Heading(),
                  const SizedBox(height: 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Battery(_color, _level)],
                  )
                ],
              );
            }),
      ),
    );
  }
}
