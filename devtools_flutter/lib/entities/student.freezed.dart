// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Student {
  String get name => throw _privateConstructorUsedError;
  String get faculty => throw _privateConstructorUsedError;
  double get gpa => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudentCopyWith<Student> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentCopyWith<$Res> {
  factory $StudentCopyWith(Student value, $Res Function(Student) then) =
      _$StudentCopyWithImpl<$Res>;
  $Res call(
      {String name, String faculty, double gpa, bool active, String? imageUrl});
}

/// @nodoc
class _$StudentCopyWithImpl<$Res> implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._value, this._then);

  final Student _value;
  // ignore: unused_field
  final $Res Function(Student) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? faculty = freezed,
    Object? gpa = freezed,
    Object? active = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      faculty: faculty == freezed
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String,
      gpa: gpa == freezed
          ? _value.gpa
          : gpa // ignore: cast_nullable_to_non_nullable
              as double,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_StudentCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$$_StudentCopyWith(
          _$_Student value, $Res Function(_$_Student) then) =
      __$$_StudentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name, String faculty, double gpa, bool active, String? imageUrl});
}

/// @nodoc
class __$$_StudentCopyWithImpl<$Res> extends _$StudentCopyWithImpl<$Res>
    implements _$$_StudentCopyWith<$Res> {
  __$$_StudentCopyWithImpl(_$_Student _value, $Res Function(_$_Student) _then)
      : super(_value, (v) => _then(v as _$_Student));

  @override
  _$_Student get _value => super._value as _$_Student;

  @override
  $Res call({
    Object? name = freezed,
    Object? faculty = freezed,
    Object? gpa = freezed,
    Object? active = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_Student(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      faculty: faculty == freezed
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String,
      gpa: gpa == freezed
          ? _value.gpa
          : gpa // ignore: cast_nullable_to_non_nullable
              as double,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Student implements _Student {
  _$_Student(
      {required this.name,
      required this.faculty,
      this.gpa = 0.0,
      this.active = false,
      this.imageUrl = null});

  @override
  final String name;
  @override
  final String faculty;
  @override
  @JsonKey()
  final double gpa;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final String? imageUrl;

  @override
  String toString() {
    return 'Student(name: $name, faculty: $faculty, gpa: $gpa, active: $active, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Student &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.faculty, faculty) &&
            const DeepCollectionEquality().equals(other.gpa, gpa) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(faculty),
      const DeepCollectionEquality().hash(gpa),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_StudentCopyWith<_$_Student> get copyWith =>
      __$$_StudentCopyWithImpl<_$_Student>(this, _$identity);
}

abstract class _Student implements Student {
  factory _Student(
      {required final String name,
      required final String faculty,
      final double gpa,
      final bool active,
      final String? imageUrl}) = _$_Student;

  @override
  String get name;
  @override
  String get faculty;
  @override
  double get gpa;
  @override
  bool get active;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_StudentCopyWith<_$_Student> get copyWith =>
      throw _privateConstructorUsedError;
}
