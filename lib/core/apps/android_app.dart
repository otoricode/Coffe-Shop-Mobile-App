import 'package:app/common/styles/app_colors.dart';
import 'package:app/common/styles/text_style.dart';
import 'package:app/modules/onboarding/screen/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../context.dart';
import '../routers/route_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: snackbarKey,
      navigatorObservers: [routeObserver],
      title: 'Coffe Shop',
      theme: ThemeData(
        primarySwatch: AppColors.materialColorprimary,
        fontFamily: 'Manrope',
        textTheme: textTheme(),
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.materialColorprimary,
        ),
        useMaterial3: true,
      ),
      home: AppPage(
        navigatorKey: _navigatorKey,
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    bool canPop = false;
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        canPop = RouteBloc().pop();
        if (canPop) {
          _closeAppDialog(context);
        }
      },
      child: StreamBuilder<List<Page<dynamic>>>(
          stream: RouteBloc().pages,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Navigator(
                key: navigatorKey,
                pages: [...snapshot.data!],
                // onPopPage: (route, result) {
                //   return route.didPop(result);
                // },
                onDidRemovePage: (page) {
                  return print(page);
                },
                onGenerateRoute: (RouteSettings? setting) {
                  if (setting == null) {
                    return null;
                  }

                  return null;
                },
              );
            }
            return Navigator(
              key: navigatorKey,
              pages: [MaterialPage(child: OnboardingPage())],
              // onPopPage: (route, result) {
              //   return route.didPop(result);
              // },
              onDidRemovePage: (page) {
                return print(page);
              },
              onGenerateRoute: (RouteSettings? setting) {
                if (setting == null) {
                  return null;
                }
                return null;
              },
            );
          }),
    );
  }

  Future<void> _closeAppDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Keluar'),
          content: const Text(
            'Apakah Anda yakin ingin keluar aplikasi?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Batal'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Keluar'),
              onPressed: () {
                Navigator.pop(context);
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
