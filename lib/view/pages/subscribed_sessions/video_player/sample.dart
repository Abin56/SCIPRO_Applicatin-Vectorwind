import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:scipro_application/view/colors/colors.dart';

class SampleVideoPLayer extends StatefulWidget {
  const SampleVideoPLayer({super.key});

  @override
  State<SampleVideoPLayer> createState() => _SampleVideoPLayerState();
}

class _SampleVideoPLayerState extends State<SampleVideoPLayer> {
  late VideoPlayerController videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;

  String videoUrl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl))
          ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: cBlack,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: cBlack,
        middle: Text(
          'Video Player',
          style: TextStyle(color: cWhite),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 500,
          child: CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController),
        ),
      ),
    );
  }
}
