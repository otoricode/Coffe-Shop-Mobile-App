import 'package:app/common/widgets/button.dart';
import 'package:app/core/routers/route_bloc.dart';
import 'package:app/core/routers/route_page.dart';
import 'package:app/modules/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:app/common/widgets/appbar.dart';
import 'package:app/modules/product/product_model.dart';
import 'package:provider/provider.dart';

import '../../../common/styles/app_colors.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductBloc>();
    return Scaffold(
      appBar: const CustomAppbar(
        appbarText: 'Detail Item',
        suffix1: Icon(
          IconlyBold.bag,
          size: 24,
          color: AppColors.white,
        ),
        suffix2: Icon(
          IconlyBold.heart,
          size: 24,
          color: AppColors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(29),
              margin: const EdgeInsets.symmetric(horizontal: 56),
              decoration: const BoxDecoration(
                color: AppColors.background,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: Offset(0, 2),
                    color: AppColors.white,
                  )
                ],
                shape: BoxShape.circle,
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.image),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Count
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: bloc.decrement,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.background,
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    StreamBuilder<int>(
                        stream: bloc.quantity.stream,
                        initialData: bloc.quantity.value,
                        builder: (context, snapshot) {
                          final quantity = snapshot.data;
                          return Text(
                            '$quantity',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.primary,
                                ),
                          );
                        }),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: bloc.incement,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.background,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            //Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 0.5,
                          color: AppColors.white,
                        )),
                    child: Row(
                      children: [
                        const Icon(
                          IconlyBold.star,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${product.rating}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.white,
                                  ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    product.roastType,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    '\$ ${product.price}',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Description',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                product.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 24),

            // Size
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: StreamBuilder<String>(
                  stream: bloc.selectedSize.stream,
                  initialData: bloc.selectedSize.value,
                  builder: (context, snapshot) {
                    final selected = snapshot.data;

                    return Row(
                      children: [
                        _SizeItem(
                            label: product.sizeOptions[0], selected: selected),
                        const SizedBox(width: 12),
                        _SizeItem(
                            label: product.sizeOptions[1], selected: selected),
                        const SizedBox(width: 12),
                        _SizeItem(
                            label: product.sizeOptions[2], selected: selected),
                      ],
                    );
                  }),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppButton(
                label: 'Buy Now',
                onTap: () async {
                  RouteBloc().push(RouteCheckout());
                },
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}

class _SizeItem extends StatelessWidget {
  const _SizeItem({
    super.key,
    required this.label,
    this.selected,
  });

  final String label;
  final String? selected;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductBloc>();
    bool isSelected = label == selected;
    return Expanded(
      child: GestureDetector(
        onTap: () => bloc.selectedSize.add(label),
        child: AspectRatio(
          aspectRatio: 4 / 2,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color:
                      isSelected ? AppColors.primary : AppColors.glassmorphism,
                ),
                left: BorderSide(
                  width: 1,
                  color:
                      isSelected ? AppColors.primary : AppColors.glassmorphism,
                ),
                bottom: isSelected
                    ? const BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      )
                    : BorderSide.none,
                right: isSelected
                    ? const BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      )
                    : BorderSide.none,
              ),
              gradient: isSelected
                  ? null
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        isSelected
                            ? Colors.orange.withOpacity(0.3)
                            : AppColors.grey.withOpacity(0.2),
                        AppColors.grey.withOpacity(0),
                      ],
                    ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color:
                          isSelected ? Colors.orange : AppColors.glassmorphism,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
