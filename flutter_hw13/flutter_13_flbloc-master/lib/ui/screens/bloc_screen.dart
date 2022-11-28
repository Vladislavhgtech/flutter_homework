import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../business/bloc/main_bloc.dart';
import '../../business/functions.dart';
import '../../data/services.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter BloC'),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: GetIt.I.get<DataNetwork>().getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  return BlocProvider(
                    create: (context) => MainBloc(),
                    child: Column(
                      children: [
                        BlocConsumer<MainBloc, MainState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            int count = 0;
                            List<String> ls = [];
                            if (state is GetBasketState) {
                              count = state.countBasket;
                              ls = state.listBasket;
                            }

                            return Container(
                              width: double.infinity,
                              color: count == 0 ? Colors.red : Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                                child: count == 0
                                    ? const Text(
                                        'В корзине пусто',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        'В корзине - $count продуктов $ls',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => Card(
                              child: ListTile(
                                title: Text(snapshot.data![index].name),
                                subtitle: Text(
                                    'Цена: ${snapshot.data![index].cost} руб.'),
                                trailing: BlocConsumer<MainBloc, MainState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    return TextButton(
                                      onPressed: () {
                                        GetIt.I.get<Basket>().updateBasket(
                                            snapshot.data![index].name);
                                        context
                                            .read<MainBloc>()
                                            .add(GetBasketEvent());
                                        print(GetIt.I.get<Basket>().basket);
                                      },
                                      child: (GetIt.I.get<Basket>().select[
                                                  snapshot.data![index].name
                                                      .toString()] ??
                                              false)
                                          ? const Text(
                                              'Удалить',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          : const Text(
                                              'Добавить',
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                default:
                  return const Text('Ошибка загрузки данных!');
              }
            }),
      ),
    );
  }
}
