import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';

import 'widgets/battery.dart';
import 'widgets/info_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery Info',
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  int _getBatteryLevel(AndroidBatteryInfo i) => i.batteryLevel!;

  Color _getBatteryColor(AndroidBatteryInfo i) {
    if (i.batteryLevel! > 75) {
      return Colors.green;
    } else if (i.batteryLevel! > 20) {
      return Colors.amber;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text(
          'Battery Info',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
      ),
      body: StreamBuilder<AndroidBatteryInfo?>(
        stream: BatteryInfoPlugin().androidBatteryInfoStream,
        builder: (context, snapshot) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
            children: snapshot.data == null
                ? const [
                    Text('Please Wait ...', textAlign: TextAlign.center),
                    SizedBox(height: 96),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 128,
                          height: 128,
                          child: CircularProgressIndicator(strokeWidth: 10),
                        ),
                      ],
                    ),
                  ]
                : [
                    Text(
                      '${_getBatteryLevel(snapshot.data!).toString()}%',
                      style: const TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Battery(
                      _getBatteryColor(snapshot.data!),
                      _getBatteryLevel(snapshot.data!),
                    ),
                    const SizedBox(height: 32),
                    const Text('Infos', style: TextStyle(fontSize: 24)),
                    InfoList(info: snapshot.data!),
                  ],
          );
        },
      ),
    );
  }
}
