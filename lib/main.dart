import 'package:flutter/material.dart';
import 'package:learn_puzzle/presentetion/pages/puzzle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "15 Puzzle",
      home: PuzzlePage(),
    );
  }
}
