class ApiServices {
  static final ApiServices _apiMethods = ApiServices._internal();

  factory ApiServices() {
    return _apiMethods;
  }

  ApiServices._internal();

  static const baseUrl = 'https://dev.seeyafit.co.il/api/';

  /// All Endpoints
  static const otpSend = '${baseUrl}otp_send';
}
