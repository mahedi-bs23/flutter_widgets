import 'package:flutter/cupertino.dart';

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
          ),
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      );
    });
  }
}