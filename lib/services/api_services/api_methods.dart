import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ApiMethods {
  static final ApiMethods _apiClient = ApiMethods._internal();
  final dio = Dio();

  factory ApiMethods() {
    return _apiClient;
  }

  ApiMethods._internal();

  static Map<String, String> getHeaderWithoutToken() {
    return {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    };
  }

  static Future<Map<String, String>> getHeaderWithToken([
    bool? isMultipart,
  ]) async {
    String? accessToken = await AppUtils().getAccessToken();
    if (isMultipart ?? false) {
      return {
        'accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
    } else {
      return {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
    }
  }

  Future<String> getMethod({
    required String method,
    required Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    if (await AppUtils().isInternetConnected()) {
      try {
        /// HTTP Code commit
        final response = await http.get(
          Uri.parse(method).replace(queryParameters: body),
          headers: header,
        );
        debugPrint(
            'url ---- ${Uri.parse(method).replace(queryParameters: body)} ----');
        debugPrint('header ---- ${header.toString()} ----');
        debugPrint('body ---- ${body.toString()} ----');
        log('response ---- ${response.body.toString()} ----');
        return response.body;
      } catch (e) {
        log('___catch___get Method error---$method>>>>> ${e.toString()}<<<<<<');
        return '';
      }
    } else {
      AppUtils().getToast('No Internet');
      return '';
    }
  }

  Future<String> postMethod({
    required method,
    required Map<String, dynamic> body,
    Map<String, String>? header,
  }) async {
    if (await AppUtils().isInternetConnected()) {
      try {
        /// HTTP Code commit
        final response = await http.post(
          Uri.parse(method),
          body: jsonEncode(body),
          headers: header,
        );
        debugPrint('url ---- ${Uri.parse(method)} ----');
        debugPrint('header ---- ${header.toString()} ----');
        debugPrint('body ---- ${body.toString()} ----');
        log('response ---- ${response.body.toString()} ----');
        /*
        log('$method >>>>Response body: ${response.body} <<<<');
         */
        return response.body;
      } catch (e) {
        log('___catch___post Method error---$method>>>>> ${e.toString()}<<<<<<');
        return '';
      }
    } else {
      AppUtils().getToast('No Internet');
      return '';
    }
  }

  Future<String> postMultipartMethod({
    required String method,
    required Map<String, String> body,
    required List<MultipartFile> files,
    required String mapKeyFile,
    required Map<String, String> header,
    required Function(int, int) onProgress,
  }) async {
    try {
      final formData = FormData();
      body.forEach((key, value) {
        formData.fields.add(MapEntry(key, value));
      });
      for (var file in files) {
        if (files.isNotEmpty) {
          formData.files.add(MapEntry(mapKeyFile, file));
        }
      }
      final response = await dio.post(
        method,
        data: formData,
        onReceiveProgress: (start, end) {},
        onSendProgress: onProgress,
        options: Options(
          headers: {
            ...header,
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      debugPrint('url ---- ${Uri.parse(method)} ----');
      debugPrint('header ---- ${header.toString()} ----');
      debugPrint('body ---- ${body.toString()} ----');
      log('response ---- ${response.data.toString()} ----');
      return jsonEncode(response.data);
    } catch (e) {
      debugPrint('url ---- ${Uri.parse(method)} ----');
      debugPrint('header ---- ${header.toString()} ----');
      debugPrint('body ---- ${body.toString()} ----');
      AppUtils().getToast(
          'postMultipartMethod error---$method>>>>> ${e.toString()}<<<<<<');
      log('postMultipartMethod error---$method>>>>> ${e.toString()}<<<<<<');
      return '';
    }
  }

  Future<String> postMultipartMethodForMultipleFiles({
    required String method,
    required Map<String, String> body,
    required Map<String, File> files,
    required Map<String, String> header,
    required Function(int, int) onProgress,
  }) async {
    try {
      final formData = FormData();
      body.forEach((key, value) {
        formData.fields.add(MapEntry(key, value));
      });
      files.forEach((paramName, file) async {
        var multipartFile = await MultipartFile.fromFile(file.path,
            filename: basename(file.path));
        formData.files.add(MapEntry(paramName, multipartFile));
        debugPrint('Adding file: ${file.path} as $paramName');
      });

      // Make the Dio post request
      final response = await dio.post(
        method,
        data: formData,
        onReceiveProgress: (start, end) {
          debugPrint('onReceiveProgress start >> $start and end >> $end');
        },
        onSendProgress: onProgress,
        options: Options(
          headers: {
            ...header,
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      debugPrint('url ---- ${Uri.parse(method)} ----');
      debugPrint('header ---- ${header.toString()} ----');
      debugPrint('body ---- ${body.toString()} ----');
      log('response ---- ${response.data.toString()} ----');
      return jsonEncode(response.data);
    } catch (e) {
      AppUtils().getToast(
          'postMultipartMethod error---$method>>>>> ${e.toString()}<<<<<<');
      log('postMultipartMethod error---$method>>>>> ${e.toString()}<<<<<<');
      return '';
    }
  }

  /// HTTP Code commit

  Future<String> postMethodMultipart({
    required http.MultipartRequest request,
  }) async {
    if (await AppUtils().isInternetConnected()) {
      try {
        http.Response result =
            await http.Response.fromStream(await request.send());
        return result.body;
      } catch (e) {
        log('___catch___postMethodMultipart error---${request.url.path}>>>>> ${e.toString()}<<<<<<');
        return '';
      }
    } else {
      AppUtils().getToast('No Internet');
      return '';
    }
  }
}
