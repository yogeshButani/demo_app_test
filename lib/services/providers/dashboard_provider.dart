import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int selectedTab = 0;

  int get currentTab => selectedTab;

  void onTap(int index) {
    selectedTab = index;
    notifyListeners();
  }
}