import 'package:price_comparator/prices/price.dart';

class PriceViewModel {
  final int id;
  final double price;
  final int count;
  final double itemPrice;

  PriceViewModel(Price price)
      : id = price.id,
        price = price.price,
        count = price.count,
        itemPrice = price.price / price.count;
}
