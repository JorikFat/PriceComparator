import 'package:flutter/material.dart';

class PriceDeleteDialog extends StatelessWidget {
  const PriceDeleteDialog({super.key});

  static Future<dynamic> show(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => const PriceDeleteDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Удаление'),
      content: const Text('Вы действительно хотите удалить продукт?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Отмена"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text("Удалить", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
