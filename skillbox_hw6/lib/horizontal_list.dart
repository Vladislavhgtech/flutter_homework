import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  final List<Widget> _data = List.generate(
      25,
      (index) => Card(
            child: Center(child: Text('$index')),
            color: Color.fromARGB(255, 255, 193, index * 10),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Horizontal list'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double _wigth = constraints.constrainWidth();
            return _wigth < 500
                ? Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) => Container(
                        child: _data[index],
                        width: 100,
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                : ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (context, index) => Container(
                      child: _data[index],
                      height: 100,
                    ),
                    scrollDirection: Axis.vertical,
                  );
          },
        ));
  }
}
