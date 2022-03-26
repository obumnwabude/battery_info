import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';

class Info {
  final String label;
  final dynamic value;
  final String unit;
  const Info(this.label, this.value, this.unit);
}

class InfoList extends StatelessWidget {
  final AndroidBatteryInfo batInfo;
  const InfoList({Key? key, required this.batInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Info> infos = [
      Info('Level', batInfo.batteryLevel, '%'),
      Info('Health', batInfo.health, ''),
      Info('Capacity', batInfo.batteryCapacity, ''),
      Info('Current Now', batInfo.currentNow, ''),
      Info('Current Average', batInfo.currentAverage, ''),
      Info('Voltage', batInfo.voltage, 'V'),
      Info('Temperature', batInfo.temperature, '°C'),
      Info('Technology', batInfo.technology, ''),
      Info('Charging Status', batInfo.chargingStatus.toString().split('.')[1],
          ''),
      Info('Plugged Status', batInfo.pluggedStatus, ''),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: infos
          .map(
            (i) => [
              const SizedBox(height: 16),
              Text(
                i.label,
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: 4),
              Text(
                i.value.toString() + i.unit,
                style: Theme.of(context).textTheme.subtitle1,
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
