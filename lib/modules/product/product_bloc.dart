import 'package:app/modules/product/product_model.dart';
import 'package:sstream/sstream.dart';

class ProductBloc {
  ProductBloc({required ProductRepo repo}) : _service = repo {
    getProduct();
  }

  final ProductRepo _service;

  final moreProduct = SStream<List<ProductModel>>([]);
  final specialProduct = SStream<List<ProductModel>>([]);

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
