// main.dart
import 'package:flutter/material.dart';
import 'app/app_view_model.dart';
import 'navigation/router_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppViewModel appViewModel = AppViewModel();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigation 2.0 with MVVM',
      routerDelegate: MyRouterDelegate(appViewModel),
      //routeInformationParser: MyRouteInformationParser(),
    );
  }
}