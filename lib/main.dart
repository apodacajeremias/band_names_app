// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:band_names_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        '': (_) => HomePage(),
      },
    );
  }
}
