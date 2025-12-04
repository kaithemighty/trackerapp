import 'package:flutter/material.dart';
import 'package:tracker/components/drawer_tile.dart';
import 'package:tracker/pages/settings_page.dart';
import 'package:tracker/pages/fitness_page.dart';
import 'package:tracker/pages/finance_page.dart';
import 'package:tracker/pages/notes_page.dart';
import 'package:tracker/pages/lists_page.dart';
import 'package:tracker/pages/goals_page.dart';
import 'package:tracker/pages/journal_page.dart';
import 'package:tracker/pages/practice_page.dart';
import 'package:tracker/pages/calories_page.dart';
import 'package:tracker/pages/landing_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //header
          const DrawerHeader(child: Icon(
            Icons.account_circle, 
            size: 50,
            ),
          ),
          DrawerTile(
            title: "Dashboard",
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingPage()
                ),
              );
            }
          ),
          //notes tile
          DrawerTile(
            title: "Notes",
            leading: const Icon(Icons.voice_over_off),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const NotesPage()
                ),
              );
            }
          ),

          DrawerTile(
            title: "Practice",
            leading: const Icon(Icons.cancel),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PracticePage()
                ),
              );
            }
          ),

          DrawerTile(
            title: "Calorie Log",
            leading: const Icon(Icons.food_bank),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CaloriesPage()
                ),
              );
            }
          ),

          DrawerTile(
            title: "Lists",
            leading: const Icon(Icons.note_alt),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListsPage()
                ),
              );
            }
          ),

          DrawerTile( 
            title: "Journal",
            leading: const Icon(Icons.book),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const JournalPage()
                ),
              );
            }
          ),

          //Fitness Tile
          DrawerTile(
            title: "Fitness", 
            leading: const Icon(Icons.run_circle),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const FitnessPage()
                ),
              );
            }
          ),

          //Finance Tile
          DrawerTile(
            title: "Finance",
            leading: const Icon(Icons.attach_money),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FinancePage()
                ),
              );
            }
          ),

          DrawerTile(
            title: "Goals",
            leading: const Icon(Icons.check),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GoalsPage()
                ),
              );
            },
          ),

          //Finances Tile

          //settings
          DrawerTile(
            title: "Tool Belt",
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage()
                ),
              );
            }
          ),
        ],
      ),

    );
  }
}