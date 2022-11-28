import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'functions.dart';

@injectable
class SimpleBloc {

  // Для счетчика товаров в корзине
  final _countOutputStateController = StreamController<int>();
  Stream<int> get countState => _countOutputStateController.stream;

  // Для формирования списка продуктов в корзине
  final _listOutputStateController = StreamController<List<String>>();
  Stream<List<String>> get listState => _listOutputStateController.stream;

  // Для добавления элементов в корзину
  final _elementOutputStateController = StreamController<bool>();
  Stream<bool> get elementState => _elementOutputStateController.stream;

  // Изменение кнопки
  final _buttonOutputStateController = StreamController<bool>();
  Stream<bool> get buttonState => _buttonOutputStateController.stream;

  // Очищение списка
  final _clearListOutputStateController = StreamController();
  Stream get clearListState => _clearListOutputStateController.stream;

  void getCount(void v) async {
    _countOutputStateController.sink.add(GetIt.I.get<Basket>().basket.length);
  }

  void getList(void v) async {
    _listOutputStateController.sink.add(GetIt.I.get<Basket>().basket);
  }

  void updateElementInBasket(String s) async {
    if(GetIt.I.get<Basket>().basket.contains(s)) {
      GetIt.I.get<Basket>().basket.remove(s);
      _elementOutputStateController.sink.add(false);
    } else {
      GetIt.I.get<Basket>().basket.add(s);
      _elementOutputStateController.sink.add(true);
    }
  }

  void updateButton(String s) async {
    if(GetIt.I.get<Basket>().select[s] == false) {
      GetIt.I.get<Basket>().select[s] = true;
    } else {
      GetIt.I.get<Basket>().select[s] = false;
    }
    bool get = GetIt.I.get<Basket>().select[s]!;
    _buttonOutputStateController.sink.add(get);
  }

  void clearList(void v) async {
    GetIt.I.get<Basket>().basket.clear();
    GetIt.I.get<Basket>().select.updateAll((key, value) => value = false);
    _clearListOutputStateController.sink;
    _buttonOutputStateController.sink.add(false);
    getCount(null);
    getList(null);
  }

  void dispose() {
    _countOutputStateController.close();
    _listOutputStateController.close();
    _elementOutputStateController.close();
    _buttonOutputStateController.close();
    _clearListOutputStateController.close();
  }
}