import 'package:app/common/widgets/button.dart';
import 'package:app/common/styles/app_colors.dart';
import 'package:app/core/routers/route_bloc.dart';
import 'package:app/core/routers/route_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/300/400?random=,'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(140),
                ),
              ),
            ),
          ),
          const Spacer(flex: 3),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  const TextSpan(text: 'Enjoy your day with\n'),
                  TextSpan(
                    text: 'Coffeeku ',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                  const TextSpan(text: 'Now'),
                ]),
          ),
          const Spacer(),
          Text(
            'We will serve delicious coffee to make\nyour day more enjoyable',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.glassmorphism,
                ),
          ),
          const Spacer(),
          SizedBox(
            width: 259,
            child: AppButton(
              label: 'Get Started',
              onTap: () async {
                RouteBloc().push(RouteDashboard());
              },
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
