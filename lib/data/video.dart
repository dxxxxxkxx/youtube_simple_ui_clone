class Video {
  String uploaderName;
  String? uploaderLogoSrc;
  String videoTitle;
  String videoInfo;
  String? thumbnailSrc;
  String videoSrc;

  Video({
    required this.uploaderName,
    required this.videoTitle,
    required this.videoInfo,
    required this.videoSrc,
    this.uploaderLogoSrc,
    this.thumbnailSrc,
  });
}
