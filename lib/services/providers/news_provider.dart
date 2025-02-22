import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  List<StoryModel> stories = [];
  bool _isLoading = true;
  bool _hasError = false;

  bool get isLoading => _isLoading;

  bool get hasError => _hasError;

  NewsProvider() {
    fetchTopStories();
  }

  Future<void> fetchTopStories() async {
    try {
      final response = await ApiMethods().getMethod(
        method: 'https://hacker-news.firebaseio.com/v0/topstories.json',
      );

      if (response != null && response is List) {
        List<int> storyIds = response.cast<int>(); // Ensure proper type
        List<StoryModel> fetchedStories = [];

        for (int i = 0; i < 20 && i < storyIds.length; i++) {
          final story = await fetchStoryDetails(storyIds[i]);
          if (story != null) {
            fetchedStories.add(story);
          }

          stories = List.from(fetchedStories);
          _isLoading = false;
          notifyListeners();
        }
      } else {
        _hasError = true;
      }
    } catch (e) {
      _hasError = true;
    }

    _isLoading = false;
    notifyListeners(); // Notify UI that loading is complete
  }

  Future<StoryModel?> fetchStoryDetails(int storyId) async {
    final response = await ApiMethods().getMethod(
      method: '${ApiServices.getNewsDetails}$storyId.json?print=pretty',
    );

    if (response != null && response is Map<String, dynamic>) {
      return StoryModel.fromJson(response); // Convert JSON to Model
    }
    return null;
  }

  void openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      AppUtils().getToast(
        'Failed to launch URL',
      );
    }
  }
}
