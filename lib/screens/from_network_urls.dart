import 'package:pod_player/pod_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayVideoFromNetworkQualityUrls extends StatefulWidget {
  const PlayVideoFromNetworkQualityUrls({Key? key}) : super(key: key);

  @override
  State<PlayVideoFromNetworkQualityUrls> createState() =>
      _PlayVideoFromAssetState();
}

class _PlayVideoFromAssetState extends State<PlayVideoFromNetworkQualityUrls> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.networkQualityUrls(
        videoUrls: [
          VideoQalityUrls(
            quality: 360,
            url:
                'https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8',
          ),
          VideoQalityUrls(
            quality: 720,
            url:
                'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
          ),
        ],
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Play video from Quality urls')),
      body: SafeArea(
        child: Center(
          child: PodVideoPlayer(
            videoTitle: Text("Video Titile"),
            controller: controller,
            podProgressBarConfig: const PodProgressBarConfig(
              padding: kIsWeb
                  ? EdgeInsets.zero
                  : EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
              playingBarColor: Colors.blue,
              circleHandlerColor: Colors.blue,
              backgroundColor: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
