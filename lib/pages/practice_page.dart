import 'package:flutter/material.dart';
import 'package:tracker/components/drawer.dart';
import 'package:tracker/components/distance_slider.dart';
import 'package:tracker/components/time_slider.dart';
import 'package:tracker/components/my_date_picker.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  void _handleDateSelected(DateTime selectedDate) {
    //insert method for handling selected date
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Run Logger'), 
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.question_mark),
            onPressed: () {}
          ),
        ],

        ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50, left: 15, right: 15),
            child: DistanceSlider(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: TimeSlider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, bottom: 30),
            child: Row(
              children: [
                MyDatePicker(onDateSelected: _handleDateSelected),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    child: const Text("Today"),
                    onPressed: () {
                      //method for inputting run entry with today's date
                    }
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Run History",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.directions_run),
                  title: Text("3.7 Miles"),
                  subtitle: Text("48 Minutes"),
                  enabled: false,
                  trailing: Icon(Icons.directions_boat_outlined),
                ),
                const ListTile(
                  leading: Icon(Icons.directions_run),
                  title: Text("3.7 Miles"),
                  subtitle: Text("48 Minutes"),
                  enabled: false,
                  trailing: Icon(Icons.directions_boat_outlined),
                ),
                const ListTile(
                  leading: Icon(Icons.directions_run),
                  title: Text("1.5 Miles"),
                  subtitle: Text("15 Minutes"),
                  enabled: false,
                  trailing: Icon(Icons.directions_boat_outlined),
                ),
                const ListTile(
                  leading: Icon(Icons.directions_run),
                  title: Text("10.7 Miles"),
                  subtitle: Text("124 Minutes"),
                  enabled: false,
                  trailing: Icon(Icons.directions_boat_outlined),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}