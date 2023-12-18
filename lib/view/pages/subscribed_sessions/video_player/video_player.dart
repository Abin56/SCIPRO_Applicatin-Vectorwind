import 'package:flutter/material.dart';
import 'package:mobs_player/mobs_player.dart';
import 'package:scipro_application/view/colors/colors.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final String videourl;

//   const VideoPlayerScreen({required this.videourl, super.key});

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController videoPlayerController;
//   late CustomVideoPlayerController _customVideoPlayerController;
//   @override
//   void initState() {
//     videoPlayerController =
//         VideoPlayerController.networkUrl(Uri.parse(widget.videourl))
//           ..initialize().then((value) => setState(() {}));
//     _customVideoPlayerController = CustomVideoPlayerController(
//       context: context,
//       videoPlayerController: videoPlayerController,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('Video player'),
//       ),
//       child: SafeArea(
//         child: Center(
//           child: CustomVideoPlayer(
//               customVideoPlayerController: _customVideoPlayerController),
//         ),
//       ),
//     );
//   }
// }

class Videoplayer extends StatefulWidget {
  final String videoUrl;

  const Videoplayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<Videoplayer> createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  Future<void> initializePlayer() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class PlayVideoFromNetwork extends StatefulWidget {
  final String url;
  const PlayVideoFromNetwork({Key? key, required this.url}) : super(key: key);

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
        widget.url,
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
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      backgroundColor: cBlack,
      body: PodVideoPlayer(controller: controller),
    );
  }
}
