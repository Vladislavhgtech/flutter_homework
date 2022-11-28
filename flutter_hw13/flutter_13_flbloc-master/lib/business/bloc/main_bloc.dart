import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../functions.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<GetBasketEvent>(_getBasket);
  }

  Future<void> _getBasket(GetBasketEvent e, Emitter emit) async {
    emit(GetBasketState(listBasket: GetIt.I.get<Basket>().basket,countBasket: GetIt.I.get<Basket>().basket.length));
  }
}
