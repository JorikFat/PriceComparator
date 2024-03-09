import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_comparator/core.dart';
import 'package:price_comparator/prices/add/price_add_dialog.dart';
import 'package:price_comparator/prices/delete/price_delete_dialog.dart';
import 'package:price_comparator/prices/price_controller.dart';

class PricesLayout extends StatelessWidget {
  const PricesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_NAME),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(32),
        child: PricesList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final controller = context.read<PriceController>();
          final values = await PriceAddDialog.show(context);
          controller.add(values);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PricesList extends StatelessWidget {
  const PricesList({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PriceController, List<PriceViewModel>>(builder: (_, list) {
        if (list.isEmpty) {
          Future(() async {
            final controller = context.read<PriceController>();
            final values = await PriceAddDialog.show(context, cancelable: false);
            controller.add(values);
          });
        }
        return ListView.separated(
          itemCount: list.length,
          separatorBuilder: (_, i) => const SizedBox(height: 4),
          itemBuilder: (_, i) => PriceWidget(list[i]),
        );
      });
}

class PriceWidget extends StatelessWidget {
  final PriceViewModel price;

  PriceWidget(this.price) : super(key: ValueKey(price.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onLongPress: () async {
          final controller = context.read<PriceController>();
          final values = await PriceDeleteDialog.show(context);
          if (values == true) controller.delete(price);
        },
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
      ),
    );
  }
}
