import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../business/functions.dart';
import '../../business/mobx.dart';
import '../../data/services.dart';

class MobxScreen extends StatelessWidget {
  const MobxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX'),
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
                      Observer(
                        builder: (context) => Container(
                          width: double.infinity,
                          color: state.countBasket > 0 ? Colors.green : Colors.red,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: state.countBasket > 0
                                ? Text(
                                    'В корзине - ${state.countBasket} продуктов ${state.productsBasket.toString()}',
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
                            child: ListTile(
                              title: Text(snapshot.data![index].name),
                              subtitle: Text(
                                  'Цена: ${snapshot.data![index].cost} руб.'),
                              trailing: TextButton(
                                onPressed: () {
                                  state.updateBasket(snapshot.data![index].id, snapshot.data![index].name);
                                },
                                child: Observer(
                                  builder: (context) {
                                   return (state.isSelected && (GetIt.I.get<Basket>().select[snapshot.data![index].name] == state.isSelected))
                                        ? const Text(
                                      'Удалить',
                                      style: TextStyle(color: Colors.red),
                                    )
                                        : const Text(
                                      'Добавить',
                                      style: TextStyle(color: Colors.green),
                                    );
                                  },
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
