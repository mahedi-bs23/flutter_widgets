import 'package:flutter/material.dart';
import 'package:flutter_widget/app/app_view_model.dart';
import 'package:flutter_widget/models/app_state.dart';
import 'package:flutter_widget/navigation/app_pages.dart';

class MyRouterDelegate extends RouterDelegate<AppState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppViewModel appViewModel;

  MyRouterDelegate(this.appViewModel) : navigatorKey = GlobalKey<NavigatorState>() {
    appViewModel.addListener(notifyListeners);
  }

  @override
  AppState get currentConfiguration => appViewModel.value;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        for (var pageEntry in pages.entries)
          if (appViewModel.value.currentPage == pageEntry.key)
            MaterialPage(child: pageEntry.value(appViewModel))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        appViewModel.goToPage(AppPage.home);
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppState configuration) async {
    appViewModel.goToPage(configuration.currentPage);
  }

  @override
  void dispose() {
    appViewModel.removeListener(notifyListeners);
    super.dispose();
  }
}
