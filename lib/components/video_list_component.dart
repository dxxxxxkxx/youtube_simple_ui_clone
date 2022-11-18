import 'package:flutter/material.dart';

import '../data/video.dart';
import '../screens/video_play_screen.dart';
import 'widget_component.dart';

class VideoListComponent extends StatelessWidget with WidgetComponent {
  final Video video;

  VideoListComponent({required this.video, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VideoPlayScreen(video: video)),
      ),
      child: Row(
        children: [
          /* 1 */
          Expanded(
            flex: 16,
            child: setThumbnail16To9(thumbnailSrc: video.thumbnailSrc),
          ),
          /* 2 */
          const Spacer(),
          /* 3 */
          Expanded(
            flex: 16,
            child: AspectRatio(
              aspectRatio: aspectRatio16To9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: setVideoTitle(
                      videoTitle: video.videoTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  setUploaderBanner(
                    uploaderLogoSrc: video.uploaderLogoSrc,
                    uploaderName: video.uploaderName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  setVideoInfo(
                    videoInfo: video.videoInfo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
