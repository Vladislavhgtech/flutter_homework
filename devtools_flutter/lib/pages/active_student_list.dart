import 'dart:async';

import 'package:devtools_flutter/components/student_tile.dart';
import 'package:devtools_flutter/main.dart';
import 'package:devtools_flutter/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///To overload memory I have made extremely large list of items and
///increased cache extent
class ActiveStudentList extends StatelessWidget {
  const ActiveStudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _students = context.read<StudentProvider>().getActiveStudents();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Students'),
      ),
      body: ListView.builder(
        cacheExtent: memory ? 999999999999 : null,
        itemCount: memory ? 10000000 : _students.length,
        itemBuilder: (context, index) =>
            StudentTile(student: _students[index % _students.length]),
      ),
    );
  }
}
