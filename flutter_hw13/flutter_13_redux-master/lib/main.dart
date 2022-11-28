import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'business/redux.dart';
import 'service_provider.dart';
import 'ui/screens/redux_screen.dart';

void main() {
  setup();
  final Store<AppState> store = Store(reducer,
      initialState:
          AppState(countBasket: 0, productsBasket: []));
  runApp(StoreProvider(store: store, child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homework 13 - Redux',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReduxScreen(),
    );
  }
}
