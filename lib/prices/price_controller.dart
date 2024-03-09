import 'package:bloc/bloc.dart';
import 'package:price_comparator/prices/add/price_values.dart';
import 'package:price_comparator/prices/price_list_case.dart';
import 'package:price_comparator/prices/price_viewmodel.dart';
import 'package:price_comparator/utils.dart';

class PriceController extends Cubit<List<PriceViewModel>> {
  final PriceListCase domain;

  PriceController(this.domain)
      : super(domain.prices.convert((it) => PriceViewModel(it)));

  void addPrice(PriceValues values) {
    domain.addPrice(values);
    _updateViewModels();
  }

  void _updateViewModels() {
    final viewModels = domain.prices.convert((it) => PriceViewModel(it));
    viewModels.sort((p1, p2) => p1.itemPrice.compareTo(p2.itemPrice));
    emit(viewModels);
  }
}
