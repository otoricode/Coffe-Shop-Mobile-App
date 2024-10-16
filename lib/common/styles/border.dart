import 'package:app/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBorder {
  static final defaultInputDecoration = InputDecoration(
    // filled: true,
    // fillColor: Colors.white,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 14.0,
      horizontal: 12.0,
    ),
    hintStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.glassmorphism,
    ),
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: AppColors.inputEnableBorder,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: AppColors.inputEnableBorder,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: AppColors.inputEnableBorder,
      ),
    ),
  );
}
