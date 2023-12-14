import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../theme/my_colors.dart';

class YoutubePlayerWidget extends StatefulWidget {
  const YoutubePlayerWidget({super.key, required this.youtubeKey});

  final String youtubeKey;

  @override
  State<YoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        loop: false,
        mute: false,
        enableCaption: false,
        controlsVisibleAtStart: false,
        hideThumbnail: true,
      ),
    );
    _controller.toggleFullScreenMode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onEnterFullScreen: () {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ]);
        },
        onExitFullScreen: () {
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: [
              SystemUiOverlay.bottom,
              SystemUiOverlay.top,
            ],
          );
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
        },
        player: YoutubePlayer(
          controller: _controller,
          progressColors: const ProgressBarColors(
            backgroundColor: Colors.grey,
            bufferedColor: Colors.white,
            handleColor: MyColors.red,
            playedColor: MyColors.red,
          ),
        ),
        builder: (_, player) => player);
  }
}
