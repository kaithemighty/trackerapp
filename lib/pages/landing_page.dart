import 'package:flutter/material.dart';
import 'package:tracker/components/drawer.dart';
import 'package:tracker/components/landing_page_tile.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  //example data for each tile
  //once finished, add in the icon for the subject in the
  //center of the progress circle
  final List<Map<String, dynamic>> tileData = [
    {'title': 'Training', 'progress': .75},
    {'title': 'Fitness', 'progress': 0.00},
    {'title': 'Calories', 'progress': .30},
    {'title': 'Lists', 'progress': 0.00},
    {'title': 'Notes', 'progress': 0.00},
    {'title': 'Journal', 'progress': .80},
    {'title': 'Goals', 'progress': .20},
    {'title': 'Finance', 'progress': .60},
    {'title': 'Learning', 'progress': 0.00},
  ];

  @override
  void initState() {
    super.initState();
  }


  //define functions within app above

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Ground Zero"),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemBuilder: (context, index) {
                  final data = tileData[index];
                  return LandingPageTile(
                    title: data['title'],
                    progress: data['progress'],
                  );
                },
                itemCount: 9,
                //itemCount: tileData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: .6,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}