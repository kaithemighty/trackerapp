import 'package:flutter/material.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key, required this.onDateSelected});

  final Function(DateTime) onDateSelected;

  @override
  State<MyDatePicker> createState() =>
  _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  // ignore: unused_field
  DateTime? _selectedDate;

  void _showDatePicker() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null && selectedDate != _selectedDate) {
      setState(() {
        _selectedDate = selectedDate;
      });

      widget.onDateSelected(selectedDate);
    }
  }
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _showDatePicker,
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: const Text("Choose Date"),
    );
  }
}