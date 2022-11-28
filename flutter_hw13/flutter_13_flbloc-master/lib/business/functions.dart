import 'package:injectable/injectable.dart';

@LazySingleton()
class Basket {
  List<String> basket = [];
  Map<String, bool> select = {};

  void updateBasket(String s) {
    if (basket.contains(s)) {
      basket.remove(s);
      select[s] = !select[s]! ? true : false;
    } else {
      basket.add(s);
      select[s] = !select[s]! ? true : false;
    }
  }
}
