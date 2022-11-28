import 'package:flutter_13_redux/business/functions.dart';
import 'package:flutter_13_redux/data/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
void setup() {
  GetIt.I.registerLazySingleton(() => DataNetwork());
  GetIt.I.registerLazySingleton(() => Basket());
}
