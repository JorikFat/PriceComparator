import 'package:bloc/bloc.dart';
import 'package:price_comparator/prices/add/price_values.dart';
import 'package:price_comparator/prices/price_list_case.dart';
import 'package:price_comparator/utils.dart';

class PriceController extends Cubit<List<PriceViewModel>> {
  final PriceListCase domain;

  PriceController(this.domain)
      : super(domain.prices.convert((it) => PriceViewModel(it)));

  void add(PriceValues values) {
    domain.add(values);
    _updateViewModels();
  }

  void delete(PriceViewModel price) {
    domain.delete(price.id);
    _updateViewModels();
  }

  void _updateViewModels() {
    final viewModels = domain.prices.convert((it) => PriceViewModel(it));
    viewModels.sort((p1, p2) => p1.itemPrice.compareTo(p2.itemPrice));
    emit(viewModels);
  }
}

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
