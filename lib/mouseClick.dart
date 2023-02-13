import 'package:flutter/material.dart';

int _clickCount = 0;

class MouseClick extends StatefulWidget {
  @override
  State<MouseClick> createState() => _MouseClickState();
}

class _MouseClickState extends State<MouseClick> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: GestureDetector(
        onTap: () {
          setState(() {
            _clickCount++;
            print(_clickCount);
          });
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    // width: 160,
                    color: Colors.red,
                    child: Center(child: Text("I am counting clicks :)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), ),
                  ),
                  Container(
                    height: 60,
                    // width: 160,
                    color: Colors.blue,
                    child: Center(child: Text("Clicks Counts: ${_clickCount}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}