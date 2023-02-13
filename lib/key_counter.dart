import 'package:flutter/material.dart';

int _keyPressCount = 0;

class KeyCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: TextField(
            onChanged: (text) {
              _keyPressCount++;
              print(_keyPressCount);
            },
          ),
        ),
      ),
    );
  }
}