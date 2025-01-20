import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? actions;
  final PreferredSizeWidget? appbar;
  final bool? isLoading;
  final Widget? bottomNavigationBar;
  final Color? backGroundColor;
  final bool automaticallyImplyLeading;
  final TextStyle? titleTextStyle;
  final VoidCallback? onBackTap;
  final VoidCallback? bottomButtonTap;

  final bool? resizeToAvoidBottomInset;

  const AppScaffold({
    super.key,
    required this.body,
    this.actions,
    this.backGroundColor,
    this.appbar,
    this.isLoading,
    this.titleTextStyle,
    this.onBackTap,
    this.bottomNavigationBar,
    this.automaticallyImplyLeading = true,
    this.resizeToAvoidBottomInset,
    this.bottomButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor ?? AppColors.colorWhite,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      body: body,
      appBar: appbar,
      bottomNavigationBar: bottomNavigationBar ?? const SizedBox.shrink(),
    );
  }
}
