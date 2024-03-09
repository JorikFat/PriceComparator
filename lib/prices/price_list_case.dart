import 'package:price_comparator/prices/add/price_values.dart';

class PriceListCase {
  int _lastId = 0;
  final List<Price> prices = [];

  void add(PriceValues values) {
    prices.add(Price(++_lastId, values.price, values.count));
  }

  void delete(int priceId) {
    prices.removeWhere((it) => it.id == priceId);
    _lastId = prices.isEmpty ? 0 : prices.last.id;
  }
}

class Price {
  final int id;
  final double price;
  final int count;

  Price(this.id, this.price, this.count);
}
