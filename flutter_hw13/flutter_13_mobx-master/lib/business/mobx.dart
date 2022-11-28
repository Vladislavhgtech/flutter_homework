import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'functions.dart';

part 'mobx.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {

  @observable
  int countBasket = 0;
  @observable
  List<String> productsBasket = [];
  @observable
  bool isSelected = false;
  @observable
  int element = 0;

  @action
  void updateBasket(int index, String name) {
    if(!GetIt.I.get<Basket>().basket.contains(name)) {
      GetIt.I.get<Basket>().basket.add(name);
      GetIt.I.get<Basket>().select[name] = true;
      countBasket = GetIt.I.get<Basket>().basket.length;
      productsBasket = GetIt.I.get<Basket>().basket;
      isSelected = GetIt.I.get<Basket>().select[name]!;
      element = index;
    } else {
      GetIt.I.get<Basket>().basket.remove(name);
      GetIt.I.get<Basket>().select[name] = false;
      countBasket = GetIt.I.get<Basket>().basket.length;
      productsBasket = GetIt.I.get<Basket>().basket;
      isSelected = GetIt.I.get<Basket>().select[name]!;
      element = index;
    }
  }
}