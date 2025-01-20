import 'package:demo_app/utils/app_file_imports.dart';

class AppUtils {
  Future<String> getAccessToken() async {
    return '';
  }

  Future<bool> isInternetConnected() async {
    return true;
  }

  getToast(msg) {
    Fluttertoast.showToast(
      backgroundColor: AppColors.themeColor,
      msg: msg.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
    );
  }
}
