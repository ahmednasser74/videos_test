import 'package:an_core_network/an_core_network.dart';
import 'package:an_core_ui/an_core_ui.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:video_compress/video_compress.dart';

import '../../features/videos/data/index.dart';
import '../index.dart';
import 'download_file_service.dart';

@Injectable()
class VideosLocalStorageService {
  static void init() {
    Hive.registerAdapter(VideoItemResponseModelAdapter());
    Hive.registerAdapter(UserResponseModelAdapter());
    Hive.registerAdapter(VideoStatusAdapter());
    Hive.registerAdapter(VideoEncodeStatusAdapter());
  }

  Future<Box<VideoItemResponseModel>> get _videosBox async {
    return await Hive.openBox<VideoItemResponseModel>(Constants.hiveVideosName);
  }

  Future<void> saveVideos(List<VideoItemResponseModel> videos) async {
    final downloadService = DownloadFileService();
    final foundedVideos = await getVideos();

    //? If we have more than 50 videos, we don't need to save more
    //* To limit local storage size
    if (foundedVideos.isNotEmpty && foundedVideos.length > 50) return;

    //? ignoring bulk insert for long processing time of downloading and saving
    // final List<VideoItemResponseModel> videosToBeSaved = [];

    for (var video in videos) {
      VideoItemResponseModel foundedVideo;
      if (foundedVideos.isNotEmpty) {
        foundedVideo = foundedVideos.firstWhere((element) => element.id == video.id);
        if (foundedVideo.id != null) continue;
      }

      /// download video thumbnail
      final thumbnail = await downloadService.downloadImage(video.thumbCdnUrl);
      video.localThumbnailPath = thumbnail;

      /// download user profile picture
      final userProfilePicture = await downloadService.downloadImage(video.user.profilePictureCdn);
      video.user.localProfilePicture = userProfilePicture;

      ///download video
      final variantUrls = await downloadService.parseMasterM3u8(video.cdnUrl);
      final variantUrl = variantUrls.first; // Use the first variant playlist
      final tsUrls = await downloadService.parseVariantM3u8(variantUrl);
      final tsUrl = tsUrls.first; // Download the first .ts segment
      final tsFilePath = await downloadService.downloadTsFile(tsUrl);

      video.localVideoPath = tsFilePath;
      // videosToBeSaved.add(video);
      _saveVideoToLocal(video);
    }
    // if (videosToBeSaved.isNotEmpty) await _saveVideosToLocal(videosToBeSaved);
  }

  Future<void> _saveVideosToLocal(List<VideoItemResponseModel> videos) async {
    final box = await _videosBox;
    await box.addAll(videos);
  }

  Future<void> _saveVideoToLocal(VideoItemResponseModel video) async {
    final box = await _videosBox;
    await box.add(video);
  }

  Future<List<VideoItemResponseModel>> getVideos() async {
    final box = await _videosBox;
    final videos = box.values.toList();
    return videos;
  }

  Future<VideoItemResponseModel?> getVideoById(dynamic id) async {
    final box = await _videosBox;
    final foundedVideo = box.values.firstWhere((video) => video.id == id, orElse: () => VideoItemResponseModel());
    if (foundedVideo.id == null) return null;
    return foundedVideo;
  }

  Future<void> clearVideos() async {
    final box = await _videosBox;
    await box.clear();
  }
}
