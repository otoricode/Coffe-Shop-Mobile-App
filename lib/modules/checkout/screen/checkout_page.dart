import 'package:app/common/widgets/appbar.dart';
import 'package:app/common/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/app_colors.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarText: 'Checkout'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _DeliveryAddress(),
            const SizedBox(height: 26),
            const _OrderDetail(),
            const SizedBox(height: 16),
            const _PaymentMethod(),
            const SizedBox(height: 44),
            const _Invoice(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: AppButton(
                label: 'Pay Now',
                onTap: () async {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Invoice extends StatelessWidget {
  const _Invoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee'),
              Text('\$ 5.00'),
            ],
          ),
          SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee'),
              Text('\$ 5.00'),
            ],
          ),
          SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee'),
              Text('\$ 5.00'),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentMethod extends StatelessWidget {
  const _PaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Payment Method'),
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 4 / 1,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 14,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.grey.withOpacity(0.2),
                    AppColors.grey.withOpacity(0),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
                border: const Border(
                  top: BorderSide(
                    color: AppColors.glassmorphism,
                  ),
                  left: BorderSide(
                    color: AppColors.glassmorphism,
                  ),
                ),
              ),
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        'product.image',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Cerdas Debit Card',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderDetail extends StatelessWidget {
  const _OrderDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Detail',
            ),
            const SizedBox(height: 16),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const _OrderDetailItem();
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                itemCount: 2),
          ],
        ));
  }
}

class _OrderDetailItem extends StatelessWidget {
  const _OrderDetailItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.grey.withOpacity(0.2),
              AppColors.grey.withOpacity(0),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            top: BorderSide(
              color: AppColors.glassmorphism,
            ),
            left: BorderSide(
              color: AppColors.glassmorphism,
            ),
          ),
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  'product.image',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'product.name',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$ {product.price}',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
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
                    onTap: () {},
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
                  Text(
                    '1',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {},
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
          ],
        ),
      ),
    );
  }
}

class _DeliveryAddress extends StatelessWidget {
  const _DeliveryAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Address'),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Home'),
                    Text('Emilia Jeha'),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text('Change'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
