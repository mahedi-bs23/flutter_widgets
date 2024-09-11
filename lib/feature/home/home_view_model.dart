import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/feature/custom_button/custom_button_view.dart';
import 'package:flutter_widget/feature/custom_scrolling_widget/reorderable_list_view/reorderable_list_view.dart';
import 'package:flutter_widget/models/widget_list_model.dart';

class HomeViewModel {

  ValueNotifier<List<WidgetListModel>> pages =
      ValueNotifier<List<WidgetListModel>>(
    [
      WidgetListModel(name: "Custom Button", page: const CustomButtonView()),
      WidgetListModel(
          name: "Reorder-able List View", page: ReorderAbleListView()),
    ],
  );
}
