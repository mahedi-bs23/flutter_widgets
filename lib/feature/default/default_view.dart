import 'package:flutter/material.dart';
import 'package:flutter_widget/app/app_view_model.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({super.key, required AppViewModel appViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: const Center(
        child: Text('Sorry, the page you are looking for does not exist.',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
