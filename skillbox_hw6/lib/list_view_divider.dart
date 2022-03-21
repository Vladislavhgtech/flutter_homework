import 'package:flutter/material.dart';

class ListViewDivider extends StatefulWidget {
  const ListViewDivider({Key? key}) : super(key: key);

  @override
  State<ListViewDivider> createState() => _ListViewDividerState();
}

class _ListViewDividerState extends State<ListViewDivider> {
  var listData = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(listData[index].toString()),
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: listData.length),
    );
  }
}
