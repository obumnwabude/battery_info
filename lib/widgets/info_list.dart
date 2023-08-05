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

  Info _timeInfo(int secs) {
    String value = '';
    final days = secs ~/ 86400;
    if (days > 0) value += '$days day${days > 1 ? 's' : ''} ';    
    final hrs = (secs % 86400) ~/ 1440;
    if (hrs > 0) value += '$hrs hour${hrs > 1 ? 's' : ''} ';
    final mins = ((secs % 86400) % 1440) ~/ 60;
    if (mins > 0) value += '$mins min${mins > 1 ? 's' : ''} ';
    secs = ((secs % 86400) % 1440) % 60;
    if (secs > 0) value += '$secs sec${secs > 1 ? 's' : ''} ';
    return Info('Remaining Charging Time', value, '');
  }

  @override
  Widget build(BuildContext context) {
    final t = info.chargeTimeRemaining;
    Info? timeInfo;
    if (t != null && t > 0) timeInfo = _timeInfo(t ~/ 1000);

    List<Info> infos = [
      Info('Charging Status', '${info.chargingStatus}'.split('.')[1], ''),
      Info('Current Now', (info.currentNow ?? 0) / 1000000, 'A'),
      Info('Current Average', (info.currentAverage ?? 0) / 1000000, 'A'),
      Info('Health', info.health, ''),
      Info('Level', info.batteryLevel, '%'),
      Info('Realtime Battery Capacity', (info.batteryCapacity ?? 0) / 1000,
          'mAh'),
      if (timeInfo != null) timeInfo,
      Info('Technology', info.technology, ''),
      Info('Temperature', info.temperature, '°C'),
      Info('Plugged Status', info.pluggedStatus, ''),
      Info('Voltage', (info.voltage ?? 0) / 1000, 'V'),
    ];

    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: infos
                .asMap()
                .entries
                .map(
                  (entry) => [
                    const SizedBox(height: 16),
                    Text(
                      entry.value.label,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${entry.value.value}${entry.value.unit}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    if (entry.key != infos.length - 1)
                      const Divider(height: 1, thickness: 1),
                  ],
                )
                .expand((w) => w)
                .toList(),
          ),
        ),
      ],
    );
  }
}
