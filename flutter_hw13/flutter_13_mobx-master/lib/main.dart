import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business/mobx.dart';
import 'service_provider.dart';
import 'ui/screens/mobx_screen.dart';

void main() {
  setup();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homework 13 - MobX',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MobxScreen(),
      ),
    );
  }
}