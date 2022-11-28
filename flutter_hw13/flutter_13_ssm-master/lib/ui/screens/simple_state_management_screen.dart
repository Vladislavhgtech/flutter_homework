import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../business/ssm.dart';
import '../../data/services.dart';

class SimpleStateManagementScreen extends StatefulWidget {
  const SimpleStateManagementScreen({Key? key}) : super(key: key);

  @override
  State<SimpleStateManagementScreen> createState() =>
      _SimpleStateManagementScreenState();
}

class _SimpleStateManagementScreenState
    extends State<SimpleStateManagementScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple State Management'),
      ),
      body: ChangeNotifierProvider<SimpleStateManagement>(
        create: (_) => SimpleStateManagement(),
        child: SafeArea(
          child: FutureBuilder(
            future: GetIt.I.get<DataNetwork>().getFruitList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Consumer<SimpleStateManagement>(
                          builder: (context, state, child) => Container(
                            width: double.infinity,
                            color: state.getCount() == 0
                                ? Colors.red
                                : Colors.green,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: state.getCount() == 0
                                  ? const Text(
                                      'В корзине пусто',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      'В корзине - ${state.getCount()} продуктов ${state.getList().toString()}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: GetIt.I
                                .get<DataNetwork>()
                                .fl
                                .map((element) {
                              return Card(
                                child: ListTile(
                                  title: Text(element.name),
                                  subtitle: Text('Цена: ${element.cost} руб.'),
                                  trailing: context
                                          .watch<SimpleStateManagement>()
                                          .checkBasket(element.id)
                                      ? TextButton(
                                          onPressed: () => context
                                              .read<SimpleStateManagement>()
                                              .changeTrailing(element.id,
                                                  element.name, element.cost),
                                          child: const Text(
                                            'Удалить',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      : TextButton(
                                          onPressed: () => context
                                              .read<SimpleStateManagement>()
                                              .changeTrailing(element.id,
                                                  element.name, element.cost),
                                          child: const Text(
                                            'Добавить',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                default:
                  return const Center(child: Text('Нет данных с сервера!'));
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
