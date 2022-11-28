import 'package:injectable/injectable.dart';

import '../models/product_model.dart';

@LazySingleton()
class Basket {
  late final Map<int, Product> _basketList = {};

  List<String> ls = [];

  void addItem(int id, String name, double cost) {
    _basketList.addAll({id : Product(id: id, name: name, cost: cost)});
  }

  void deleteItem(int id) {
    _basketList.remove(id);
  }

  bool checkItemInBasket(int id) {
    return _basketList.containsKey(id);
  }

  int getBasketItems() {
    return _basketList.length;
  }
}