import 'package:app/common/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarText: 'NAMA COFFE'),
      body: Text('hahahha'),
    );
  }
}
