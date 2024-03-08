import 'package:flutter/material.dart';
import 'package:price_comparator/prices/prices_layout.dart';

class PricesScreen extends StatefulWidget {
  const PricesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PricesScreen> {
  @override
  Widget build(BuildContext context) {
    return const PricesLayout();
  }
}
