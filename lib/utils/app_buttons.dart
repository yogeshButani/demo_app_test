import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final double? textSize;
  final double? borderRadius;
  final double? btnRadius;
  final double? btnWidth;
  final double? btnHeight;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? borderColor;
  final bool? isLoading;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.name,
    this.textStyle,
    this.textSize,
    this.padding,
    this.btnRadius,
    this.borderRadius,
    this.btnWidth,
    this.btnHeight,
    this.buttonColor,
    this.borderColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth ?? MediaQuery.of(context).size.width,
      height: btnHeight ?? 45,
      margin: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 30.0)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.colorWhite,
            backgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent.withValues(alpha: 0.38),
            disabledBackgroundColor: Colors.transparent.withValues(alpha: 0.12),
            shadowColor: Colors.transparent,
            animationDuration: const Duration(milliseconds: 500),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            ),
            //make color or elevated button transparent
          ),
          onPressed: (isLoading ?? false)
              ? null
              : () {
                  onPressed(); // Trigger the button action
                },
          child: Visibility(
            visible: isLoading ?? false,
            replacement: Text(
              name,
              style: textStyle ??
                   TextStyle(
                    fontSize: textSize ?? 16,
                    color: AppColors.colorWhite,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            child: const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: AppColors.colorWhite,
                  strokeWidth: 3,
                )),
          ),
        ),
      ),
    );
  }
}
