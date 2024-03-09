import 'package:flutter/material.dart';
import 'package:price_comparator/prices/price_controller.dart';
import 'package:price_comparator/prices/price_list_case.dart';
import 'package:price_comparator/prices/prices_layout.dart';
import 'package:provider/provider.dart';

class PricesScreen extends StatelessWidget {
  const PricesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PriceController(PriceListCase()),
      child: const PricesLayout()
    );
  }
}
