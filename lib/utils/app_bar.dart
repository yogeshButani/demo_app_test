import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundcolor;
  final double? toolbarheight;
  final bool automaticallyImplyLeading;
  final TextStyle? titleTextStyle;
  final VoidCallback? onBackTap;
  final Widget? leading;
  final Widget? action;

  const Appbar(
      {super.key,
      this.title,
      this.backgroundcolor,
      this.titleTextStyle,
      this.toolbarheight,
      this.onBackTap,
      this.leading,
      this.action,
      this.automaticallyImplyLeading = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [action ?? const SizedBox.shrink()],
      backgroundColor: AppColors.colorWhite,
      toolbarHeight: toolbarheight ?? 73,
      forceMaterialTransparency: true,
      leading: leading ??
          Visibility(
            visible: automaticallyImplyLeading,
            replacement: const SizedBox.shrink(),
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  splashColor: AppColors.themeColor.withValues(alpha: 0.7),
                  splashFactory: InkRipple.splashFactory,
                  onTap: onBackTap ??
                      () =>
                          Future.delayed(const Duration(milliseconds: 180), () {
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          }),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.colorF5F5F5,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 25,
                      color: AppColors.colorBlack,
                    ),
                  ),
                ),
              ),
            ),
          ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(title ?? "",
          style: titleTextStyle ??
              TextStyle(
                fontSize: 16,
                color: AppColors.colorBlack,
              )),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
