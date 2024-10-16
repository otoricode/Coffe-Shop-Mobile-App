import 'package:app/common/styles/app_colors.dart';
import 'package:app/core/routers/my_pop_scope.dart';
import 'package:flutter/material.dart';

import '../../core/routers/route_bloc.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 14.0,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 24,
                    color: itemColor ?? AppColors.white,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    appbarText,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: itemColor ?? AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30)
            ],
          ),
        ),
      ),
    );
  }
}
