// Main entry point of the app.
// This file initializes Hive and launches the HomePage.
// Clean and simple for the MVP.

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'storage/hive_storage.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive (local storage)
  await Hive.initFlutter();
  await HiveStorage.init();

  runApp(const TourQuestApp());
}

class TourQuestApp extends StatelessWidget {
  const TourQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TourQuest',
      debugShowCheckedModeBanner: false, // Cleaner look
      theme: ThemeData(
        primarySwatch: Colors.red,        // SUU color vibe
        useMaterial3: true,                // Modern UI
      ),
      home: const HomePage(),             // First screen
    );
  }
}