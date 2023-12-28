import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
// class ChewieDemo extends StatefulWidget {
//   final String videourl;
//   const ChewieDemo({super.key, required this.videourl});

//   @override
//   _ChewieDemoState createState() => _ChewieDemoState();
// }

// class _ChewieDemoState extends State<ChewieDemo> {
//   late VideoPlayerController _videoPlayerController;
//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController =
//         VideoPlayerController.networkUrl(Uri.parse(widget.videourl));
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       aspectRatio: 16 / 9,
//       autoPlay: true,
//       looping: true,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         foregroundColor: cWhite,
//         title: const Text(
//           'Video Player',
//           style: TextStyle(color: cWhite),
//         ),
//       ),
//       body: Center(
//         child: Chewie(
//           controller: _chewieController,
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
// }
import 'package:video_player/video_player.dart';

class PlayVideoFromNetwork extends StatefulWidget {
  final String videourl;
  const PlayVideoFromNetwork({required this.videourl, Key? key})
      : super(key: key);

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(widget.videourl),
    ));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(flickManager: flickManager),
    );
  }
}
