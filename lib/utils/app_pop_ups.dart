import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class AppPopUp {
  static void dialogueBox(
      {required BuildContext context,
      required Widget body,
      bool? barrierDismissible,
      Function? callApi}) {
    showDialog(
      barrierDismissible: barrierDismissible ?? true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(7),
          backgroundColor: Colors.transparent,
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: body,
            ),
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        callApi!(value);
      }
    });
  }

  static void bottomSheet({
    required BuildContext context,
    required Widget body,
    bool? barrierDismissible,
    Function? callApi,
  }) {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: barrierDismissible ?? true,
      duration: const Duration(milliseconds: 150),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: body,
        );
      },
    ).then((value) {
      if (value != null) {
        callApi!(value);
      }
    });
  }
}
