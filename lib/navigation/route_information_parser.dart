import 'package:flutter/cupertino.dart';
import 'package:flutter_widget/models/app_state.dart';
import 'app_pages.dart';


class MyRouteInformationParser extends RouteInformationParser<AppState> {
  @override
  Future<AppState> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');

    if (uri.pathSegments.isEmpty) {
      return AppState(currentPage: AppPage.home);
    }

    final pageKey = uri.pathSegments[0];
    final appPage = _getPageFromPath(pageKey);

    return AppState(currentPage: appPage ?? AppPage.home);
  }

  AppPage? _getPageFromPath(String path) {
    switch (path) {
      case 'home':
        return AppPage.home;
      case 'custom_button':
          return AppPage.customButton;
      default:
        return AppPage.unknown;
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppState state) {
    switch (state.currentPage) {
      case AppPage.home:
        return const RouteInformation(location: '/home');
      case AppPage.customButton:
        return const RouteInformation(location: '/custom_button');
      default:
        return const RouteInformation(location: '/unknown');
    }
  }
}
