import 'package:flutter/material.dart';

import '../components/video_list_component.dart';
import '../data/video.dart';
import '../repositories/video_repository.dart';

class VideoListScreen extends StatelessWidget {
  final List<Video> _videos = VideoRepository().videos;

  VideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: _videos.length,
      itemBuilder: (BuildContext context, int index) =>
          VideoListComponent(video: _videos[index]),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 16.0),
    );
  }
}
