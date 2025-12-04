import 'package:flutter/material.dart';

class DistanceSlider extends StatefulWidget {
  const DistanceSlider({super.key});

  @override
  State<DistanceSlider> createState() =>
  _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {
  double _distanceSliderValue = .15;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Distance of Run (Miles)"),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            valueIndicatorTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            activeTrackColor: Theme.of(context).colorScheme.inversePrimary,
            thumbColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          child: Slider(
            value: _distanceSliderValue,
            max: 15,
            divisions: 60,
            label: _distanceSliderValue.toString(),
            onChanged: (double value) {
              setState(() {
                _distanceSliderValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}