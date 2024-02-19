import 'package:flutter/material.dart';
import 'views/views.dart';
import 'utils/utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ligthBaseTheme,
      home: const HomePage(),
    );
  }
}
