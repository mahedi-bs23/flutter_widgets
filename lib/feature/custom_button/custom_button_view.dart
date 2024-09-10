import 'package:flutter/material.dart';
import 'package:flutter_widget/common/widgets/custom_scroll_view.dart';

class CustomButtonView extends StatefulWidget {
  const CustomButtonView({super.key});

  @override
  State<CustomButtonView> createState() => _CustomButtonViewState();
}

class _CustomButtonViewState extends State<CustomButtonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
