import 'package:flutter/material.dart';

import 'service_provider.dart';
import 'ui/screens/bloc_screen.dart';

void main() {
  setup();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homework 13 - Cubit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CubitScreen(),
    );
  }
}
