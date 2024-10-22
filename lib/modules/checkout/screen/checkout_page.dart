import 'package:app/common/widgets/appbar.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/core/routers/route_bloc.dart';
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
                onTap: () async {
                  popUp(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> popUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.background,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                size: 60.0,
                color: AppColors.primary,
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'Your payment has been confirmed. you can check the details order.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.white,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24.0,
              ),
              AppButton(
                label: 'Back to home',
                onTap: () async {
                  Navigator.pop(context);
                  RouteBloc().backHome();
                },
              ),
            ],
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Fee',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '\$ 5.00',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Fee',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '\$ 5.00',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Fee',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '\$ 5.00',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
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
          Text(
            'Payment Method',
            style: Theme.of(context).textTheme.labelMedium,
          ),
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
            Text(
              'Order Detail',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.white,
                  ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Address',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.white,
                ),
          ),
          const SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '[Home]',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.primary,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Emilia Jeha',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Cibadak street 63, 43351 Sukabumi, Jawa Barat',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    highlightColor: AppColors.glassmorphism,
                    child: SizedBox(
                      height: 48.0,
                      width: 48.0,
                      child: Center(
                        child: Text(
                          'Change',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.primary,
                                  ),
                        ),
                      ),
                    ),
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
