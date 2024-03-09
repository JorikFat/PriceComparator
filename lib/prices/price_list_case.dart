import 'package:price_comparator/prices/add/price_values.dart';
import 'package:price_comparator/prices/price.dart';

class PriceListCase {
  int _lastId = 0;
  final List<Price> prices = [];

  void addPrice(PriceValues values) {
    prices.add(Price(++_lastId, values.price, values.count));
  }
}
