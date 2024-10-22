import 'package:app/modules/product/product_model.dart';
import 'package:sstream/sstream.dart';

class ProductBloc {
  ProductBloc({required ProductRepo repo}) : _service = repo {
    getProduct();
  }

  final ProductRepo _service;

  final moreProduct = SStream<List<ProductModel>>([]);
  final specialProduct = SStream<List<ProductModel>>([]);

  final selectedSize = ''.stream;
  final quantity = 1.stream;

  void incement() {
    var currentValue = quantity.value;
    currentValue = currentValue + 1;
    print(currentValue);
    quantity.add(currentValue);
  }

  void decrement() {
    var currentValue = quantity.value;
    if (currentValue <= 1) {
      return;
    }
    currentValue = currentValue - 1;
    quantity.add(currentValue);
  }

  Future<void> getProduct() async {
    try {
      final response = await _service.getProductList();

      final divider = (response.length / 2).ceil();

      final specialData = response.sublist(0, divider);
      final remainingData = response.sublist(divider);

      specialProduct.add(specialData);
      moreProduct.add(remainingData);
    } catch (e) {
      rethrow;
    }
  }
}
