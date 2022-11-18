import 'package:drico_chat/constants/resources.dart';
import 'package:drico_chat/features/authentication/presentation/getting_start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),

        // Define the default font family.
        fontFamily: 'DMSan',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'DMSan')),
      ),
      home: const GettingStart(),
    );
  }
}
