import'package:flutter/material.dart';

class FitnessDataTile extends StatefulWidget {
  const FitnessDataTile({super.key});

  @override
  State<FitnessDataTile> createState() => _FitnessDataTileState();
}

class _FitnessDataTileState extends State<FitnessDataTile> {
  bool isDataEntry = true;

  void toggleMode() {
    setState(() {
      isDataEntry = !isDataEntry;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleMode,
      child: Container(
        decoration: BoxDecoration(
          color: isDataEntry ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            isDataEntry ? 'Data Entry' : 'Visualization',
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16),
          ),
        ),
      ),
    );
  }
}