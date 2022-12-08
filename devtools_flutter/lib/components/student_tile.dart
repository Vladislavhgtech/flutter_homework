import 'package:devtools_flutter/entities/student.dart';
import 'package:devtools_flutter/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({
    Key? key,
    required this.student,
  }) : super(key: key);

  final Student student;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(student.name),
      subtitle: Row(
        children: [
          Text(student.faculty),
          const SizedBox(width: 30.0),
          Text('GPA: ${student.gpa.toString()}'),
        ],
      ),
      leading: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: student.imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  student.imageUrl!,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.person_off_outlined),
      ),
      trailing: student.active
          ? IconButton(
              onPressed: () {
                context.read<StudentProvider>().remove(student);
              },
              icon: const Icon(Icons.remove),
            )
          : IconButton(
              onPressed: () {
                context.read<StudentProvider>().add(student);
              },
              icon: const Icon(Icons.add),
            ),
    );
  }
}
