import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconly/iconly.dart';
import 'package:sstream/sstream.dart';

import 'package:app/common/widgets/text_input.dart';

import '../../../common/styles/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  const TextSpan(text: 'Make your day\nwith '),
                  TextSpan(
                    text: 'Coffeeku ',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                ]),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(
                child: TextInput(
                  prefix: const Icon(
                    IconlyLight.search,
                    color: AppColors.glassmorphism,
                    size: 24,
                  ),
                  hint: 'Search your favorite coffee',
                  stream: SStream(''),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(8),
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
                  child: const Icon(
                    IconlyBold.category,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const _SpecialForYou(),
        const SizedBox(height: 24),
        const _MoreProduct(),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _MoreProduct extends StatelessWidget {
  const _MoreProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'More Product',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _MoreProductItem(
                index: index,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: 12,
          ),
        )
      ],
    );
  }
}

class _MoreProductItem extends StatelessWidget {
  const _MoreProductItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'https://picsum.photos/200/200?random=1$index',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cuppacino Lata',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 6),
              Text(
                'Decof Roast',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.glassmorphism,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$ 5.10',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _SpecialForYou extends StatelessWidget {
  const _SpecialForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special for you',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.glassmorphism,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _SpecialForYouItem(
                index: index,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: 12,
          ),
        ),
      ],
    );
  }
}

class _SpecialForYouItem extends StatelessWidget {
  const _SpecialForYouItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: const Border(
              top: BorderSide(
                color: AppColors.glassmorphism,
              ),
              left: BorderSide(
                color: AppColors.glassmorphism,
              )),
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.grey.withOpacity(0.2),
              AppColors.grey.withOpacity(0),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/200/200?random=$index',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Cuppacino Lata',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Decof Roast',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.glassmorphism,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$ 5.10',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.primary,
                          ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    IconlyBold.plus,
                    color: AppColors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
