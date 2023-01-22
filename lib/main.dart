import 'package:flutter/material.dart';

import 'mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHAT GPT PLAYGROUND',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,

      ),
      home: MainScreen(),
    );
  }
}
