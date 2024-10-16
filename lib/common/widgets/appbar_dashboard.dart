import 'package:app/common/styles/app_colors.dart';
import 'package:app/core/routers/my_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../core/routers/route_bloc.dart';

class AppbarDashboard extends StatelessWidget implements PreferredSizeWidget {
  const AppbarDashboard({
    super.key,
    required this.appbarText,
    this.onBack,
    this.backgroundColor,
    this.itemColor,
  });

  final String appbarText;
  final Function()? onBack;
  final Color? backgroundColor;
  final Color? itemColor;

  @override
  Size get preferredSize => const Size(double.infinity, 85.0);

  @override
  Widget build(BuildContext context) {
    return MyPopScope(
      child: Container(
        width: double.infinity,
        color: backgroundColor ?? AppColors.background,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  if (onBack != null) onBack!();
                  RouteBloc().pop();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(
                    left: 24.0,
                    right: 14.0,
                  ),
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
                  child: Image.asset('assets/icons/drawer_icon.png'),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    appbarText,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.primary),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(
                    left: 14.0,
                    right: 24.0,
                  ),
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
                  child: Icon(
                    IconlyBold.notification,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
