import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'functions.dart';

class SimpleStateManagement with ChangeNotifier {

  int getCount() {
    return GetIt.I.get<Basket>().ls.length;
  }

  List<String> getList() {
    return GetIt.I.get<Basket>().ls;
  }

  changeTrailing(int id, String name, double cost) {
    if (GetIt.I.get<Basket>().checkItemInBasket(id)) {
      GetIt.I.get<Basket>().deleteItem(id);
      GetIt.I.get<Basket>().ls.remove(name);
    } else {
      GetIt.I.get<Basket>().addItem(id, name, cost);
      GetIt.I.get<Basket>().ls.add(name);
    }
    notifyListeners();
  }

  bool checkBasket(int id) {
    return GetIt.I.get<Basket>().checkItemInBasket(id);
  }
}
