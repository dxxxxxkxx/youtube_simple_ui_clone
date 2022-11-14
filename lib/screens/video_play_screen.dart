import 'package:flutter/material.dart';

import '../components/my_scaffold.dart';
import '../components/video_play_component.dart';
import '../data/video.dart';

class VideoPlayScreen extends StatelessWidget {
  final Video video;

  const VideoPlayScreen({required this.video, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(body: VideoPlayComponent(video: video));
  }
}
