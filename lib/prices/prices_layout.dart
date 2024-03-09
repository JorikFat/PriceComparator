import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:price_comparator/core.dart';
import 'package:price_comparator/prices/add/price_add_dialog.dart';
import 'package:price_comparator/prices/price_controller.dart';
import 'package:price_comparator/prices/price_viewmodel.dart';

class PricesLayout extends StatelessWidget {
  const PricesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_NAME),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: BlocBuilder<PriceController, List<PriceViewModel>>(
          bloc: GetIt.I.get<PriceController>(),
          builder: (_, list) => ListView.separated(
            itemCount: list.length,
            separatorBuilder: (_, i) => const SizedBox(height: 4),
            itemBuilder: (_, i) => PriceWidget(list[i]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final values = await PriceAddDialog.show(context);
          GetIt.I.get<PriceController>().addPrice(values);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  final PriceViewModel price;

  PriceWidget(this.price) : super(key: ValueKey(price.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('${price.count} шт'),
            Text('${price.price} ₽'),
            Text('${price.itemPrice.toStringAsFixed(2)} ₽/шт'),
          ],
        ),
      ),
    );
  }
}
