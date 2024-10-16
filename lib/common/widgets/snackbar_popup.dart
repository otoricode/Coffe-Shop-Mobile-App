import 'package:app/core/context.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

void snackbarPopup({
  String? message,
  IconData? icon,
  Color? color,
  int? duration,
  void Function()? onTap,
}) {
  snackbarKey.currentState?.removeCurrentSnackBar();
  snackbarKey.currentState?.showSnackBar(
    SnackBar(
        duration: Duration(milliseconds: duration ?? 1200),
        // duration: const Duration(milliseconds: 10000000),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: InkWell(
          onTap: onTap,
          child: Container(
            // height: 74.0,

            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),

            decoration: BoxDecoration(
              color: color ?? Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        message ?? 'Message',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                if (icon != null) ...[
                  const SizedBox(width: 12),
                  Icon(
                    icon,
                    // Iconsax.shopping_bag,
                    color: Colors.white,
                    size: 20.0,
                  )
                ]
              ],
            ),
          ),
        )),
  );
}
