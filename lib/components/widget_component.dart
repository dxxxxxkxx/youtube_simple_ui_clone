import 'package:flutter/material.dart';

mixin WidgetComponent {
  final double aspectRatio16To9 = 16 / 9;

  Widget setVideo16To9({required String videoSrc}) {
    return AspectRatio(
      aspectRatio: aspectRatio16To9,
      child: Image.asset('assets/images/$videoSrc', fit: BoxFit.contain),
    );
  }

  Widget setVideoTitle({
    required String videoTitle,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      videoTitle,
      maxLines: maxLines,
      overflow: overflow,
      style: const TextStyle(fontSize: 20.0, color: Colors.white),
    );
  }

  Widget setVideoInfo({
    required String videoInfo,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      videoInfo,
      maxLines: maxLines,
      overflow: overflow,
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget setUploaderBanner({
    required String? uploaderLogoSrc,
    required String uploaderName,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: SizedBox(
        height: 24.0,
        child: Row(
          children: [
            if (uploaderLogoSrc != null) ...[
              ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/images/logos/$uploaderLogoSrc',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 8.0)
            ],
            Text(
              uploaderName,
              maxLines: maxLines,
              overflow: overflow,
              style: const TextStyle(color: Colors.white, height: 1.0),
            )
          ],
        ),
      ),
    );
  }
}
