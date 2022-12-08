import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';

@freezed
class Student with _$Student {
  factory Student({
    required String name,
    required String faculty,
    @Default(0.0) double gpa,
    @Default(false) bool active,
    @Default(null) String? imageUrl,
  }) = _Student;
}
