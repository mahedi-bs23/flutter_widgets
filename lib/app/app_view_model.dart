import 'package:flutter/material.dart';
import 'package:flutter_widget/models/app_state.dart';
import 'package:flutter_widget/navigation/app_pages.dart';

class AppViewModel extends ValueNotifier<AppState> {
  AppViewModel() : super(AppState(currentPage: AppPage.home));

  void goToPage(AppPage page) {
    try {
      value = AppState(currentPage: page);
    } catch (e) {
      value = AppState(currentPage: AppPage.unknown);
    }
    notifyListeners();
  }
}
