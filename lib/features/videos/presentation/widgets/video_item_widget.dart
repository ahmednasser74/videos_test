import 'dart:io';

import 'package:an_core_ui/an_core_ui.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:videos_test/core/src/colors.dart';

import '../../data/index.dart';

class VideoItemWidget extends StatefulWidget {
  final VideoItemResponseModel video;
  const VideoItemWidget({super.key, required this.video});

  @override
  State<VideoItemWidget> createState() => _VideoItemWidgetState();
}

class _VideoItemWidgetState extends State<VideoItemWidget> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool _isLiked = false;
  bool _isFollowing = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    if (widget.video.localVideoPath != null) {
      _controller = VideoPlayerController.file(File(widget.video.localVideoPath!));
    } else {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.video.cdnUrl));
    }
    await _controller.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      showControls: false,
    );

    setState(() {});
  }

  void _togglePlay() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {});
  }

  Widget _buildVideoPlayer() {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: _togglePlay,
            child: Chewie(controller: _chewieController),
          )
        : _thumbnailImage();
  }

  Widget _thumbnailImage() {
    return Center(
      child: () {
        if (widget.video.localThumbnailPath != null) {
          return Image.file(File(widget.video.localThumbnailPath!));
        } else {
          return Image.network(widget.video.thumbCdnUrl);
        }
      }(),
    );
  }

  ImageProvider get _userProfilePicture {
    if (widget.video.user.localProfilePicture != null) {
      return FileImage(File(widget.video.user.localProfilePicture!));
    } else {
      return NetworkImage(widget.video.user.profilePictureCdn);
    }
  }

  Widget _buildUserInfo() {
    return Positioned(
      bottom: 40.h,
      left: 16.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: _showUserDialog,
                child: CircleAvatar(
                  backgroundImage: _userProfilePicture,
                  radius: 20.r,
                ),
              ),
              10.widthBox,
              Text(
                widget.video.user.username,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.widthBox,
              StatefulBuilder(
                builder: (context, setState) => GestureDetector(
                  onTap: () => setState(() => _isFollowing = !_isFollowing),
                  child: AppContainer(
                    paddingHorizontal: 8.w,
                    paddingVertical: 4.h,
                    color: Colors.white24,
                    borderRadius: 8.r,
                    borderColor: Colors.white,
                    child: AppText(
                      _isFollowing ? 'Following' : 'Follow',
                      color: Colors.white,
                      size: 12.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          10.heightBox,
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: AppText(
              widget.video.title,
              color: Colors.white,
              size: 14.sp,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideButtons() {
    return Positioned(
      bottom: 60.h,
      right: 16.w,
      child: Column(
        children: [
          StatefulBuilder(builder: (context, setState) {
            return Column(
              children: [
                IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _isLiked ? Colors.red : Colors.white,
                    size: 30.sp,
                  ),
                  onPressed: () => setState(() => _isLiked = !_isLiked),
                ),
                AppText(
                  _isLiked ? (widget.video.totalLikes + 1).toString() : widget.video.totalLikes.toString(),
                  color: Colors.white,
                  size: 14.sp,
                ),
              ],
            );
          }),
          8.heightBox,
          IconButton(
            icon: Icon(Icons.comment, color: Colors.white, size: 30.sp),
            onPressed: () {},
          ),
          Text(
            widget.video.totalComments.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          8.heightBox,
          IconButton(
            icon: Icon(Icons.share, color: Colors.white, size: 30.sp),
            onPressed: () {},
          ),
          AppText(
            widget.video.totalShare.toString(),
            color: Colors.white,
            size: 14.sp,
          ),
          8.heightBox,
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Colors.white, size: 30.sp),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Positioned(
      bottom: 10.h,
      left: 16.w,
      right: 16.w,
      child: Row(
        children: [
          Expanded(
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: Colors.red,
                bufferedColor: Colors.grey,
                backgroundColor: Colors.white24,
              ),
            ),
          ),
          8.widthBox,
          AppText(
            _formatDuration(widget.video.duration),
            size: 12.sp,
            color: Colors.white70,
          ),
          StatefulBuilder(builder: (context, setState) {
            return IconButton(
              icon: Icon(
                _controller.value.volume > 0 ? Icons.volume_up : Icons.volume_off,
                color: Colors.white,
                size: 24.sp,
              ),
              onPressed: () {
                setState(() {
                  _controller.setVolume(_controller.value.volume > 0 ? 0 : 1);
                });
              },
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Stack(
              children: [
                _buildVideoPlayer(),
                // _playVideoIcon(),
              ],
            ),
          ),
          _buildUserInfo(),
          _buildSideButtons(),
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _playVideoIcon() {
    if (!_controller.value.isInitialized || !_controller.value.isPlaying) {
      return Center(
        child: AnimatedOpacity(
          opacity: !_controller.value.isPlaying ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: IconButton(
            onPressed: _togglePlay,
            icon: Icon(
              Icons.play_circle_rounded,
              color: AppColors.greyColor.withOpacity(.6),
              size: 64.sp,
            ),
          ),
        ),
      );
    }
    return const SizedBox();
  }

  void _showUserDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 10,
          backgroundColor: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      widget.video.user.username,
                      size: 20.sp,
                      weight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    8.heightBox,
                    // Full Name
                    AppText(
                      widget.video.user.fullname,
                      size: 16.sp,
                      color: Colors.black54,
                    ),
                    8.heightBox,
                    AppText(
                      widget.video.user.designation,
                      size: 14.sp,
                      color: Colors.black45,
                    ),
                    20.heightBox,
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        'Close',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -50.h,
                child: CircleAvatar(
                  backgroundImage: _userProfilePicture,
                  radius: 50.r,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.w,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDuration(int durationInSeconds) {
    final duration = Duration(seconds: durationInSeconds);
    final minutes = duration.inMinutes;
    final seconds = durationInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
