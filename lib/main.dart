import 'package:flutter/material.dart';
import 'package:test_suitemedia/screen/firts_screen.dart';
import 'package:test_suitemedia/screen/second_screen.dart';
import 'package:test_suitemedia/screen/thrid_screen.dart';
import 'package:test_suitemedia/widget/globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test Suitemedia',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber,
        appBarTheme:  AppBarTheme(
          backgroundColor: white,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) =>  const FirstScreen(),
        '/second_screen': (context) => const SecondScreen(),
        '/third_screen':(context) =>  const ThirdScreen(),
      },
    );
  }
}


