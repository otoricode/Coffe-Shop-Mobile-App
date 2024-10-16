import 'package:app/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

TextTheme textTheme() {
  return const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      fontFamily: 'Playfair Display',
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: AppColors.white,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: AppColors.white,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: AppColors.glassmorphism,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: AppColors.glassmorphism,
    ),
  );
}
