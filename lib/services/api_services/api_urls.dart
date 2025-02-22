class ApiServices {
  static final ApiServices _apiMethods = ApiServices._internal();

  factory ApiServices() {
    return _apiMethods;
  }

  ApiServices._internal();

  static const getNewsIds = 'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty';
  static const getNewsDetails = 'https://hacker-news.firebaseio.com/v0/item/';
}
