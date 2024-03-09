import 'package:flutter/material.dart';
import 'package:price_comparator/prices/add/price_values.dart';

class PriceAddDialog extends StatelessWidget {
  PriceAddDialog({super.key});

  static Future<dynamic> show(BuildContext context) async {
    return showDialog(context: context, builder: (_) => PriceAddDialog());
  }

  final count = TextEditingController();
  final price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Добавить продукт'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: count,
            decoration: const InputDecoration(hintText: "Количество"),
          ),
          TextField(
            controller: price,
            decoration: const InputDecoration(hintText: "Цена"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Отмена"),
        ),
        TextButton(
          onPressed: () {
            final values = PriceValues(
              int.parse(count.text),
              double.parse(price.text),
            );
            return Navigator.pop(context, values);
          },
          child: const Text("Добавить"),
        ),
      ],
    );
  }
}
