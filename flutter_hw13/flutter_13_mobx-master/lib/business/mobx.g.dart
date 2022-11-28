// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
  late final _$countBasketAtom =
      Atom(name: '_AppState.countBasket', context: context);

  @override
  int get countBasket {
    _$countBasketAtom.reportRead();
    return super.countBasket;
  }

  @override
  set countBasket(int value) {
    _$countBasketAtom.reportWrite(value, super.countBasket, () {
      super.countBasket = value;
    });
  }

  late final _$productsBasketAtom =
      Atom(name: '_AppState.productsBasket', context: context);

  @override
  List<String> get productsBasket {
    _$productsBasketAtom.reportRead();
    return super.productsBasket;
  }

  @override
  set productsBasket(List<String> value) {
    _$productsBasketAtom.reportWrite(value, super.productsBasket, () {
      super.productsBasket = value;
    });
  }

  late final _$isSelectedAtom =
      Atom(name: '_AppState.isSelected', context: context);

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$elementAtom = Atom(name: '_AppState.element', context: context);

  @override
  int get element {
    _$elementAtom.reportRead();
    return super.element;
  }

  @override
  set element(int value) {
    _$elementAtom.reportWrite(value, super.element, () {
      super.element = value;
    });
  }

  late final _$_AppStateActionController =
      ActionController(name: '_AppState', context: context);

  @override
  void updateBasket(int index, String name) {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.updateBasket');
    try {
      return super.updateBasket(index, name);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
countBasket: ${countBasket},
productsBasket: ${productsBasket},
isSelected: ${isSelected},
element: ${element}
    ''';
  }
}
