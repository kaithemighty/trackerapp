import 'package:flutter/material.dart';
import 'package:tracker/components/drawer.dart';
import 'package:tracker/components/fitness_data_tile.dart';

class FitnessPage extends StatelessWidget {
  const FitnessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Fitness'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.autorenew),
            tooltip: 'HelpfulText',
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          
          //Grid Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemBuilder: (context, index) {
                  return const FitnessDataTile(
                  );
                },
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}