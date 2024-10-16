import 'dart:convert';

import 'package:app/modules/product/product_model.dart';
import 'package:flutter/services.dart';

class HttpProductRepo implements ProductRepo {
  @override
  Future<List<ProductModel>> getProductList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/fake_product_data.json');
      final List<dynamic> data = json.decode(response);

      return data.map((jsonItem) => ProductModel.fromMap(jsonItem)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
