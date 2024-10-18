import 'package:app/common/widgets/appbar.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarText: 'Checkout'),
      body: SingleChildScrollView(),
    );
  }
}
