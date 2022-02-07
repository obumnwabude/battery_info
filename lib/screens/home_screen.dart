import 'package:flutter/material.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import '../widgets/battery.dart';
import '../widgets/heading.dart';
import '../widgets/loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Color _getColor(int level) => level > 75
      ? Colors.green
      : level > 20
          ? Colors.amber
          : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0),
      body: StreamBuilder<AndroidBatteryInfo?>(
          stream: BatteryInfoPlugin().androidBatteryInfoStream,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Loader(title: 'Save Battery');
            }

            int _level = snapshot.data!.batteryLevel!;
            Color _color = _getColor(_level);
            return ListView(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              children: [
                const Heading('Save Battery'),
                const SizedBox(height: 48),
                Text(
                  '${_level.toString()}%',
                  style: const TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Battery(_color, _level),
                const SizedBox(height: 32),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text('Optimize',
                            style: TextStyle(fontSize: 18))),
                    const SizedBox(height: 8),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text('CPU Cooler',
                            style: TextStyle(fontSize: 18))),
                    const SizedBox(height: 8),
                    ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/info'),
                        child: const Text('Battery Info',
                            style: TextStyle(fontSize: 18))),
                    const SizedBox(height: 32),
                  ],
                )
              ],
            );
          }),
    );
  }
}
