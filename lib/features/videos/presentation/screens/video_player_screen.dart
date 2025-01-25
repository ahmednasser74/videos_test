import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  final ({String? url, String? file}) video;

  VideoPlayerScreen({super.key, required this.video}) {
    if (video.url == null && video.file == null) {
      throw ArgumentError('Either videoUrl or videoFilePath must be provided.');
    }
  }

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    if (widget.video.url != null) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.video.url!));
    } else if (widget.video.file != null) {
      _controller = VideoPlayerController.file(File(widget.video.file!));
    }

    await _controller.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: false,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? Chewie(controller: _chewieController)
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
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
