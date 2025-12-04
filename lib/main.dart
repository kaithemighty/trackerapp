import 'package:flutter/material.dart';
import 'package:tracker/models/note_database.dart';
import 'package:provider/provider.dart';
import 'pages/landing_page.dart';
import 'package:tracker/theme/theme_provider.dart';


void main() async {
  //initialize isar database -- 
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        //Note Provider 
        ChangeNotifierProvider(create: (context) => NoteDatabase()),

        //Theme Provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()..loadThemePreference())

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const LandingPage(),
          theme: themeProvider.themeData,
        );
      },
    );
  }
}
