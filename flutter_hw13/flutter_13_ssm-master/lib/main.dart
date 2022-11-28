import 'package:flutter/material.dart';
import 'package:flutter_13_ssm/service_provider.dart';
import 'package:flutter_13_ssm/ui/screens/simple_state_management_screen.dart';

void main() {
  initializeServices();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple State Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SimpleStateManagementScreen(),
    );
  }
}