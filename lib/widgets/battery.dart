import 'package:flutter/material.dart';

class Battery extends StatelessWidget {
  final Color color;
  final int level;
  const Battery(this.color, this.level, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _levels = [100, 90, 80, 70, 60, 50, 40, 30, 20, 10];

    return Column(
      children: [
        Container(
          width: 64,
          height: 12,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: color),
              left: BorderSide(width: 1, color: color),
              right: BorderSide(width: 1, color: color),
            ),
          ),
        ),
        Container(
          width: 120,
          height: 228,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: color),
          ),
          child: Column(
            children: _levels
                .map((n) => [
                      Container(
                        height: 16,
                        decoration: BoxDecoration(
                          color: level >= n ? color : null,
                          border: Border.all(width: 1, color: color),
                        ),
                      ),
                      if (n != 10) const SizedBox(height: 6)
                    ])
                .expand((w) => w)
                .toList(),
          ),
        ),
      ],
    );
  }
}
