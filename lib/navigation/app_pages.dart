import 'package:flutter/cupertino.dart';
import 'package:flutter_widget/app/app_view_model.dart';
import 'package:flutter_widget/feature/custom_button/custom_button_view.dart';
import 'package:flutter_widget/feature/default/default_view.dart';
import 'package:flutter_widget/feature/home/home_view.dart';




enum AppPage { unknown, home, customButton}

final Map<AppPage, Widget Function(AppViewModel)> pages = {
  AppPage.unknown: (viewModel) => UnknownView(appViewModel: viewModel),
  AppPage.home: (viewModel) => HomePage(appViewModel: viewModel),
  AppPage.customButton: (viewmodel) => const CustomButtonView()

};
