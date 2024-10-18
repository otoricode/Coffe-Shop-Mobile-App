import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:app/common/widgets/appbar.dart';
import 'package:app/modules/product/product_model.dart';

import '../../../common/styles/app_colors.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarText: 'Detail Item'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
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

            // Count
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.background,
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '120',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.background,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.primary,
                    ),
                  ),
                ],
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
              child: Row(
                children: [
                  _SizeItem(
                    label: 'S',
                  ),
                  SizedBox(width: 12),
                  _SizeItem(
                    label: 'M',
                  ),
                  SizedBox(width: 12),
                  _SizeItem(
                    label: 'L',
                  ),
                ],
              ),
            )
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
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: AspectRatio(
          aspectRatio: 4 / 2,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(
                  width: 1,
                  color: AppColors.glassmorphism,
                ),
                left: BorderSide(
                  width: 1,
                  color: AppColors.glassmorphism,
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.grey.withOpacity(0.2),
                  AppColors.grey.withOpacity(0),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.glassmorphism,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
