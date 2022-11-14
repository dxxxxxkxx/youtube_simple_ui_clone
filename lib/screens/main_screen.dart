import 'package:flutter/material.dart';

import '../components/my_scaffold.dart';
import 'video_list_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(body: VideoListScreen());
  }
}
