import 'package:devtools_flutter/components/student_tile.dart';
import 'package:devtools_flutter/pages/active_student_list.dart';
import 'package:devtools_flutter/pages/network_items.dart';
import 'package:devtools_flutter/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _students = context.watch<StudentProvider>().allStudents;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.network_wifi),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NetworkItems()));
          },
        ),
        title: const Text('KBTU Students'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ActiveStudentList()));
              },
              icon: const Icon(Icons.person)),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: _students.length,
        itemBuilder: (context, index) => StudentTile(student: _students[index]),
      ),
    );
  }
}
