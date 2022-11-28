import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'business/functions.dart';
import 'data/services.dart';

@InjectableInit()
void setup() {
  GetIt.I.registerLazySingleton(() => DataNetwork());
  GetIt.I.registerLazySingleton(() => Basket());
}