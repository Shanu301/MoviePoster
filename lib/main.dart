import 'package:flutter/material.dart';
import 'package:marvelposter/views/moviesposter.dart';

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
      title: 'Movies Poster',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MoviesPoster(),
    );
  }
}


