import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kalam/pages/HomePage.dart';
import 'package:kalam/provider/CourseRegistrationController.dart';
import 'package:kalam/provider/ApproveListController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseRegistrationController()),
        ChangeNotifierProvider(create: (_) => ApproveListController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), 
    );
  }
}