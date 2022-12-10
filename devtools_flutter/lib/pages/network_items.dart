import 'package:flutter/material.dart';

class NetworkItems extends StatelessWidget {
  const NetworkItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('From Network')),
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (context, index) =>
            Image.network('https://picsum.photos/id/${index + 1}/200'),
      ),
    );
  }
}
