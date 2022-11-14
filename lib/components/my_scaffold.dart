import 'package:flutter/material.dart';

import 'my_app_bar.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;

  const MyScaffold({required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const MyAppBar(),
      body: body,
    );
  }
}
