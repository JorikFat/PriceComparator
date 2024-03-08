import 'package:flutter/material.dart';
import 'package:price_comparator/core.dart';
import 'package:price_comparator/prices/price.dart';
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
        child: PriceWidget(
          PriceViewModel(Price(1, 100, 10)),
        ),
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
            Text('${price.itemPrice} ₽/шт'),
          ],
        ),
      ),
    );
  }
}
