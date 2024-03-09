import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:price_comparator/prices/price_controller.dart';
import 'package:price_comparator/prices/price_list_case.dart';
import 'package:price_comparator/prices/prices_layout.dart';

class PricesScreen extends StatefulWidget {
  const PricesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PricesScreen> {
  late final PriceController controller;

  @override
  void initState() {
    super.initState();
    if (GetIt.I.isRegistered<PriceController>()) return;
    GetIt.I
        .registerSingleton<PriceController>(PriceController(PriceListCase()));
  }

  @override
  Widget build(BuildContext context) {
    return const PricesLayout();
  }
}
