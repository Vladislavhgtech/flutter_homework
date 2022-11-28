import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

import '../../business/bloc.dart';
import '../../business/functions.dart';
import '../../data/services.dart';

class CubitScreen extends StatefulWidget {
  const CubitScreen({Key? key}) : super(key: key);

  @override
  State<CubitScreen> createState() => _CubitState();
}

class _CubitState extends State<CubitScreen> {
  late SimpleBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SimpleBloc();
    bloc.getCount(null);
    bloc.getList(null);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: SafeArea(
        child: StreamBuilder3(
            streams: StreamTuple3(GetIt.I.get<DataNetwork>().getData(),
                bloc.elementState, bloc.buttonState),
            builder: (context, snapshots) {
              switch (snapshots.snapshot1.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  return Column(
                    children: [
                      StreamBuilder2(
                          streams:
                              StreamTuple2(bloc.countState, bloc.listState),
                          builder: (context, snapshots) {
                            return Container(
                              width: double.infinity,
                              color: snapshots.snapshot1.data == 0
                                  ? Colors.red
                                  : Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                                child: snapshots.snapshot1.data == 0
                                    ? const Text(
                                        'В корзине пусто',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        'В корзине - ${snapshots.snapshot1.data} продуктов ${snapshots.snapshot2.data.toString()}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ),
                            );
                          }),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshots.snapshot1.data?.length,
                          itemBuilder: (context, index) => Card(
                            child: ListTile(
                              title:
                                  Text(snapshots.snapshot1.data![index].name),
                              subtitle: Text(
                                  'Цена: ${snapshots.snapshot1.data![index].cost} руб.'),
                              trailing: TextButton(
                                onPressed: () async {
                                  bloc.updateElementInBasket(
                                      snapshots.snapshot1.data![index].name);
                                  bloc.updateButton(
                                      snapshots.snapshot1.data![index].name);
                                  bloc.getCount(null);
                                  bloc.getList(null);
                                },
                                child: (GetIt.I.get<Basket>().select[snapshots
                                            .snapshot1.data![index].name
                                            .toString()] ??
                                        false)
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
                    ],
                  );
                default:
                  return const Text('Ошибка загрузки данных!');
              }
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.clearList(null);
        },
        child: const Icon(Icons.clear),
      ),
    );
  }
}
