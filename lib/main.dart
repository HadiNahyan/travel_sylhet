import 'package:flutter/material.dart';
import 'package:travel_sylhet/travel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Sylhet',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Travel()
    );
  }
}

