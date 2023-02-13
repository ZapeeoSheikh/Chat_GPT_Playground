import 'package:flutter/material.dart';

int _keyPressCount = 0;

class KeyCounter extends StatefulWidget {
  @override
  State<KeyCounter> createState() => _KeyCounterState();
}

class _KeyCounterState extends State<KeyCounter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: 'Key Counter',
          ),
                onChanged: (text) {
                  setState(() {
                    _keyPressCount++;
                    print(_keyPressCount);
                  });
                },
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                // width: 160,
                color: Colors.blue,
                child: Center(child: Text("Key Press Counts: ${_keyPressCount}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}