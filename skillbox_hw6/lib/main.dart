import 'package:flutter/material.dart';
import 'package:skillbox_hw6/horizontal_list.dart';
import 'package:skillbox_hw6/sliver_widgets.dart';
import 'package:skillbox_hw6/text_field_styled.dart';
import 'package:skillbox_hw6/list_view_divider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ListViewDivider(),
      //home: HorizontalList(),
      //home: SliverWidgets(),
      home: TextFieldStyled(),
    );
  }
}
