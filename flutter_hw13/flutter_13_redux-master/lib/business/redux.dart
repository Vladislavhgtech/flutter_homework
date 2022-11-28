import 'package:flutter_13_redux/business/functions.dart';
import 'package:get_it/get_it.dart';

// Action
class UpdateBasketAction {
  final int id;
  final String name;

  UpdateBasketAction({required this.id, required this.name});
}

// Reducer
AppState reducer(AppState state, dynamic action) {
  if (action is UpdateBasketAction) {
    if(!GetIt.I.get<Basket>().basket.contains(action.name)) {
      GetIt.I.get<Basket>().basket.add(action.name);
      GetIt.I.get<Basket>().select[action.name] = true;
      return AppState(
          countBasket: GetIt.I.get<Basket>().basket.length,
          productsBasket: GetIt.I.get<Basket>().basket);
    } else {
      GetIt.I.get<Basket>().basket.remove(action.name);
      GetIt.I.get<Basket>().select[action.name] = false;
      return AppState(
          countBasket: GetIt.I.get<Basket>().basket.length,
          productsBasket: GetIt.I.get<Basket>().basket);
    }
  } else {
    return AppState(countBasket: 0, productsBasket: []);
  }
}

// Global App State
class AppState {
  final int countBasket;
  final List<String> productsBasket;

  AppState(
      {required this.countBasket,
      required this.productsBasket});
}
