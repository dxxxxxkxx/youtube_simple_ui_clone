import 'package:flutter/material.dart';

import '../components/my_scaffold.dart';
import '../components/video_play_component.dart';
import '../components/widget_component.dart';
import '../data/video.dart';

class VideoPlayScreen extends StatelessWidget with WidgetComponent {
  final Video video;

  VideoPlayScreen({required this.video, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayComponent(videoSrc: video.videoSrc),
            const SizedBox(height: 16.0),
            setVideoTitle(videoTitle: video.videoTitle),
            const SizedBox(height: 32.0),
            setVideoInfo(videoInfo: video.videoInfo),
            const SizedBox(height: 8.0),
            const Divider(color: Colors.grey, thickness: 1.0),
            const SizedBox(height: 8.0),
            setUploaderBanner(
              uploaderLogoSrc: video.uploaderLogoSrc,
              uploaderName: video.uploaderName,
            )
          ],
        ),
      ),
    );
  }
}
