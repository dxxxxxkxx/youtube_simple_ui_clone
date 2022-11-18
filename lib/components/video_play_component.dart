import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'widget_component.dart';

class VideoPlayComponent extends StatefulWidget {
  final String videoSrc;

  const VideoPlayComponent({required this.videoSrc, Key? key})
      : super(key: key);

  @override
  State<VideoPlayComponent> createState() => _VideoPlayComponentState();
}

class _VideoPlayComponentState extends State<VideoPlayComponent>
    with WidgetComponent {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  double _volume = 100;
  bool _isMuted = false;
  bool _isPlayerReady = false;

  final List<String?> _ids = [];

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoSrc)!,
      //_ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: [
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(color: Colors.white, fontSize: 18.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.white, size: 25.0),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
      ),
      builder: (context, player) => ListView(
        shrinkWrap: true,
        children: [
          player,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: _isPlayerReady
                          ? () {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                              setState(() {});
                            }
                          : null,
                    ),
                    IconButton(
                      icon: Icon(
                        _isMuted ? Icons.volume_off : Icons.volume_up,
                        color: Colors.white,
                      ),
                      onPressed: _isPlayerReady
                          ? () {
                              _isMuted
                                  ? _controller.unMute()
                                  : _controller.mute();
                              setState(() {
                                _isMuted = !_isMuted;
                              });
                            }
                          : null,
                    ),
                    FullScreenButton(
                      controller: _controller,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
                _space,
                Row(
                  children: <Widget>[
                    const Text(
                      "Volume",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.white),
                    ),
                    Expanded(
                      child: Slider(
                        inactiveColor: Colors.transparent,
                        value: _volume,
                        min: 0.0,
                        max: 100.0,
                        divisions: 10,
                        label: '${(_volume).round()}',
                        onChanged: _isPlayerReady
                            ? (value) {
                                setState(() {
                                  _volume = value;
                                });
                                _controller.setVolume(_volume.round());
                              }
                            : null,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
