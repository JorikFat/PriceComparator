import 'package:flutter/material.dart';
import 'package:price_comparator/prices/add/price_values.dart';

class PriceAddDialog extends StatelessWidget {
  final bool cancelable;

  PriceAddDialog({this.cancelable = true, super.key});

  static Future<dynamic> show(
    BuildContext context, {
    bool cancelable = true,
  }) async =>
      showDialog(
        context: context,
        barrierDismissible: cancelable,
        builder: (_) => PriceAddDialog(cancelable: cancelable),
      );

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
            focusNode: FocusNode()..requestFocus(),
            textInputAction: TextInputAction.next,
            controller: count,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Количество"),
          ),
          TextField(
            controller: price,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Цена"),
          ),
        ],
      ),
      actions: [
        if (cancelable)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Отмена"),
          ),
        TextButton(
          onPressed: () {
            final values = PriceValues(
              int.parse(count.text),
              double.parse(price.text.replaceAll(',', '.')),
            );
            return Navigator.pop(context, values);
          },
          child: const Text("Добавить"),
        ),
      ],
    );
  }
}
