import 'dart:async';

import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';

import 'widgets/battery.dart';
import 'widgets/info_list.dart';

void main() => runApp(const MyApp());

extension on AndroidBatteryInfo {
  int get level => batteryLevel ?? 0;
  Color get color => level > 20 ? Colors.green : Colors.red;
}

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AndroidBatteryInfo? _info;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (_) async {
      final info = await BatteryInfoPlugin().androidBatteryInfo;
      setState(() => _info = info);
    });
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
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
        children: [
          if (_info == null) ...const [
            Text('Please Wait ...', textAlign: TextAlign.center),
            SizedBox(height: 96),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 128,
                  height: 128,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ],
            ),
            SizedBox(height: 96),
          ] else ...[
            Text(
              '${_info!.level}%',
              style: const TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Battery(_info!.color, _info!.level),
            const SizedBox(height: 64),
            InfoList(info: _info!),
          ],
        ],
      ),
    );
  }
}
