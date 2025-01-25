import '../../../../core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/index.dart';

class VideoItemWidget extends StatelessWidget {
  final VideoItemResponseModel video;
  const VideoItemWidget({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      paddingAll: 4.sp,
      gradientColors: [AppColors.primaryColor, AppColors.primaryColor, AppColors.primaryLightColor, AppColors.primaryLightColor.withOpacity(0.5)],
      borderRadius: 12.r,
      child: AppContainer(
        borderRadius: 12.sp,
        color: Colors.black87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Thumbnail
            GestureDetector(
              onTap: () => context.pushNamed(
                Routes.videoPlayerScreen,
                arguments: (url: video.cdnUrl, file: null),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      video.thumbCdnUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.play_circle_fill, size: 48, color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),

            // Video Title and User Info
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    video.title,
                    size: 12,
                    weight: FontWeight.bold,
                    color: Colors.white,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(video.user.profilePictureCdn),
                            radius: 16,
                          ),
                          title: AppText(
                            video.user.username,
                            size: 14,
                            color: Colors.white70,
                          ),
                          subtitle: AppText(
                            video.user.designation,
                            size: 10,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      8.widthBox,
                      AppText(
                        _formatDuration(video.duration),
                        size: 14,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Video Metadata (Views, Likes, Comments, etc.)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMetadataItem(Icons.visibility, video.totalViews.toString()),
                  _buildMetadataItem(Icons.thumb_up, video.totalLikes.toString()),
                  _buildMetadataItem(Icons.comment, video.totalComments.toString()),
                  _buildMetadataItem(Icons.share, video.totalShare.toString()),
                ],
              ),
            ),
            12.heightBox,
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataItem(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.white70),
        4.widthBox,
        AppText(value, size: 12, color: Colors.white70),
      ],
    );
  }

  String _formatDuration(int durationInSeconds) {
    final duration = Duration(seconds: durationInSeconds);
    final minutes = duration.inMinutes;
    final seconds = durationInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
