part of 'main_bloc.dart';

@immutable
abstract class MainState {
  const MainState();
}

class MainInitial extends MainState {}

class GetBasketState extends MainState {
  final int countBasket;
  final List<String> listBasket;

  const GetBasketState({required this.countBasket, required this.listBasket});
}
