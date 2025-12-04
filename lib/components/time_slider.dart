import 'package:flutter/material.dart';

class TimeSlider extends StatefulWidget {
  const TimeSlider({super.key});

  @override
  State<TimeSlider> createState() =>
  _TimeSliderState();
}

class _TimeSliderState extends State<TimeSlider> {
  double _timeSliderValue = .5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Time to Complete Run (Minutes)"),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            valueIndicatorTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            activeTrackColor: Theme.of(context).colorScheme.inversePrimary,
            thumbColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          child: Slider(
            value: _timeSliderValue,
            max: 180,
            divisions: 180,
            label: _timeSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _timeSliderValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}