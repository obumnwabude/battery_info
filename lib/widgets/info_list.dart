import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';

class Info {
  final String label;
  final dynamic value;
  final String unit;
  const Info(this.label, this.value, this.unit);
}

class InfoList extends StatelessWidget {
  final AndroidBatteryInfo info;
  const InfoList({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Info> infos = [
      Info('Level', info.batteryLevel, '%'),
      Info('Health', info.health, ''),
      Info('Capacity', info.batteryCapacity, ''),
      Info('Current Now', info.currentNow, ''),
      Info('Current Average', info.currentAverage, ''),
      Info('Voltage', info.voltage, 'V'),
      Info('Temperature', info.temperature, '°C'),
      Info('Technology', info.technology, ''),
      Info('Charging Status', '${info.chargingStatus}'.split('.')[1], ''),
      Info('Plugged Status', info.pluggedStatus, ''),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: infos
          .map(
            (i) => [
              const SizedBox(height: 16),
              Text(
                i.label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              Text(
                i.value.toString() + i.unit,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              if (i.label != 'Plugged Status')
                const Divider(height: 1, thickness: 1),
            ],
          )
          .expand((w) => w)
          .toList(),
    );
  }
}
