import 'package:app/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../error/error.dart';
import 'snackbar_popup.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final Future<void> Function() onTap;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      highlightElevation: 1.5,
      elevation: 2,
      onPressed: loading
          ? null
          : () async {
              setState(() {
                loading = true;
              });
              widget.onTap().then((v) {
                setState(() {
                  loading = false;
                });
              }).catchError((e) {
                if (e is Errors) {
                  snackbarPopup(
                    message: e.message,
                    color: AppColors.error,
                  );
                }

                if (e is List<Errors> && e.isNotEmpty) {
                  snackbarPopup(
                    message: e[0].message,
                    color: AppColors.error,
                  );
                }
                setState(() {
                  loading = false;
                });
              });
            },
      splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primary,
        ),
        child: Center(
            child: loading
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    widget.label,
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.label,
    this.onTap,
    this.child,
    this.borderRadius,
  });
  final String? label;
  final Function()? onTap;
  final Widget? child;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
        child: child ??
            Center(
              child: Text(
                label ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFD61972),
                  fontSize: 13,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.26,
                ),
              ),
            ),
      ),
    );
  }
}

class LightButton extends StatelessWidget {
  const LightButton({
    super.key,
    this.onTap,
    required this.label,
  });
  final Function()? onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: AppColors.error,
          ),
          borderRadius: BorderRadius.circular(43),
        ),
      ),
      child: Text(
        label,
      ),
    );
  }
}
