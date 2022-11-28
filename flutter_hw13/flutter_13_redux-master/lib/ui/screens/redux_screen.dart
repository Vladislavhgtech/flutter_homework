import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../business/functions.dart';
import '../../business/redux.dart';
import '../../data/services.dart';

class ReduxScreen extends StatelessWidget {
  const ReduxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> simple = StoreProvider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux'),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: GetIt.I.get<DataNetwork>().getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  return Column(
                    children: [
                      StoreConnector<AppState, AppState>(
                        converter: (store) => store.state,
                        builder: (context, vm) => Container(
                          width: double.infinity,
                          color: vm.countBasket > 0 ? Colors.green : Colors.red,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: vm.countBasket > 0
                                ? Text(
                                    'В корзине - ${vm.countBasket} продуктов ${vm.productsBasket.toString()}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const Text(
                                    'В корзине пусто',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) => Card(
                            child: StoreConnector<AppState, AppState>(
                              converter: (store) => store.state,
                              builder: (context, vm) => ListTile(
                                title: Text(snapshot.data![index].name),
                                subtitle: Text(
                                    'Цена: ${snapshot.data![index].cost} руб.'),
                                trailing: TextButton(
                                  onPressed: () {
                                    simple.dispatch(UpdateBasketAction(
                                        id: snapshot.data![index].id,
                                        name: snapshot.data![index].name));
                                  },
                                  child: GetIt.I.get<Basket>().select[snapshot.data![index].name] ?? false
                                      ? const Text(
                                          'Удалить',
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : const Text(
                                          'Добавить',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                default:
                  return const Center(child: Text('Нет данных с сервера!'));
              }
            }),
      ),
    );
  }
}
