import '../data/video.dart';

class VideoRepository {
  final List<Video> _videos = [
    /* 1 */
    Video(
      uploaderName: 'Rupina Kim 루피나 킴',
      videoTitle: '(Malta Life) First Vlog 몰타 일상 #1',
      videoInfo: '조회수 1만회 • 5년 전',
      videoSrc: 'pizza.jpg',
    ),

    /* 2 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '짜장면 내기',
      videoInfo: '조회수 431만회 • 1개월 전',
      videoSrc: 'billiard.jpg',
    ),

    /* 3 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '10주년',
      videoInfo: '조회수 1146만회 • 7개월 전',
      videoSrc: 'anniversary10.jpg',
    ),

    /* 4 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '오래 사귄 커플의 즐겁고 편안한 휴식과 익숙한 안정감',
      videoInfo: '조회수 1004만회 • 7개월 전',
      videoSrc: 'rest.jpg',
    ),

    /* 5 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '꺼져',
      videoInfo: '조회수 903만회 • 6개월 전',
      videoSrc: 'siblings.jpg',
    ),

    /* 6 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '맥주집',
      videoInfo: '조회수 333만회 • 3일 전',
      videoSrc: 'pub.jpg',
    ),

    /* 7 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '사장님 판 좀 갈아주세요',
      videoInfo: '조회수 424만회 • 2주 전',
      videoSrc: 'restaurant.jpg',
    ),

    /* 8 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '아프면 손 드세요',
      videoInfo: '조회수 746만회 • 6개월 전',
      videoSrc: 'dentist.jpg',
    ),

    /* 9 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '마감 30분 전',
      videoInfo: '조회수 949만회 • 8개월 전',
      videoSrc: 'salon.jpg',
    ),

    /* 10 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '예쁜 카페',
      videoInfo: '조회수 699만회 • 7개월 전',
      videoSrc: 'cafe.jpg',
    ),

    /* 11 */
    Video(
      uploaderName: '숏박스',
      uploaderLogoSrc: 'shortbox.jpg',
      videoTitle: '병문안',
      videoInfo: '조회수 521만회 • 4개월 전',
      videoSrc: 'hospital.jpg',
    )
  ];

  List<Video> get videos => _videos;
}
