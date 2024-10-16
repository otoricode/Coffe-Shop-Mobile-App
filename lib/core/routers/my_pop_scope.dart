import 'dart:io';

import 'package:flutter/material.dart';

class MyPopScope extends StatelessWidget {
  const MyPopScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: Platform.isIOS ? false : true,
      child: child,
    );
  }
}
