import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Ui%20Kit/ui.dart';
import 'package:untitled/mainScreen.dart';

import 'key_counter.dart';
import 'mouseClick.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          // title: 'ChatGPT Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            backgroundColor: MyColor.backgroundColor,
            useMaterial3: true,
          ),
          // home: const ChatScreen(),
          home: KeyCounter(),

        );
      },
    );
  }
}
