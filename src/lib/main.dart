import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'storage/hive_storage.dart';
import 'ui/main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}