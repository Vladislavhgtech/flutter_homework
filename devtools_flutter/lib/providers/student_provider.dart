import 'package:devtools_flutter/entities/student.dart';
import 'package:devtools_flutter/mock_data/mock_students.dart';
import 'package:devtools_flutter/mock_data/opt_mock_students.dart';
import 'package:flutter/material.dart';
import 'package:devtools_flutter/main.dart';

class StudentProvider with ChangeNotifier {
  final List<Student> _allStudents = isOpt ? optStudents : students;

  List<Student> get allStudents => _allStudents;

  List<Student> getActiveStudents() {
    return List.of(_allStudents.where((element) => element.active));
  }

  void add(Student student) {
    final int index =
        _allStudents.indexWhere((element) => element.name == student.name);
    _allStudents[index] = _allStudents[index].copyWith(active: true);
    notifyListeners();
  }

  void remove(Student student) {
    final int index =
        _allStudents.indexWhere((element) => element.name == student.name);
    _allStudents[index] = _allStudents[index].copyWith(active: false);
    notifyListeners();
  }
}
