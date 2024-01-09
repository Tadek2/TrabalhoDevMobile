import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';

class LocalVideoPlayer extends StatefulWidget {
  const LocalVideoPlayer({Key? key}) : super(key: key);

  @override
  _LocalVideoPlayerState createState() => _LocalVideoPlayerState();
}

class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    _controller = VideoPlayerController.asset(
      '../videos/topGun.mp4',
    );
    await _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
      aspectRatio: 16 / 9,
      customControls: const CupertinoControls(
        backgroundColor: Colors.blue,
        iconColor: Colors.white,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _controller.value.isInitialized
              ? Chewie(
                  controller: _chewieController,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
