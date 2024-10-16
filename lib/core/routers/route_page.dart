import 'package:app/modules/dashboard/screen/dashboard_page.dart';
import 'package:app/modules/product/product_model.dart';
import 'package:app/modules/product/screen/product_detail_page.dart';
import 'package:flutter/material.dart';

import '../../modules/onboarding/screen/onboarding_page.dart';

abstract class RoutePage {
  final MaterialPage page;
  final bool isProtected;
  final String name;
  RoutePage(this.page, this.name, {this.isProtected = false});
}

class RouteOnboarding extends RoutePage {
  RouteOnboarding()
      : super(const MaterialPage(child: OnboardingPage()), '/onborading');
}

class RouteDashboard extends RoutePage {
  RouteDashboard()
      : super(const MaterialPage(child: DashboardPage()), '/dashboard');
}

class RouteProductDetail extends RoutePage {
  RouteProductDetail(ProductModel product)
      : super(
          MaterialPage(child: ProductDetailPage(product: product)),
          '/product-detail',
        );
}
