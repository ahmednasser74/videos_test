import 'package:an_core_network/an_core_network.dart';
import 'package:injectable/injectable.dart';
import 'package:videos_test/core/index.dart';

import '../models/index.dart';

abstract class VideosLocalDataSource {
  Future<AppResponseListResult<VideoItemResponseModel>> getVideos();
}

@LazySingleton(as: VideosLocalDataSource)
class VideosLocalDataSourceImpl implements VideosLocalDataSource {
  final Network network;
  VideosLocalDataSourceImpl({required this.network});

  @override
  Future<AppResponseListResult<VideoItemResponseModel>> getVideos() async {
    final db = di<VideosLocalStorageService>();
    final videos = await db.getVideos();
    if (videos.isNotEmpty) {
      final videosToJson = videos.map((e) => e.toJson()).toList();
      final x = AppResponseListResult<VideoItemResponseModel>.fromJson(
        {
          'code': 200,
          'data': {
            'data': videosToJson,
            'meta_data': {'total': 0}
          },
        },
        VideoItemResponseModel(),
      );
      return x;
    }
    return AppResponseListResult<VideoItemResponseModel>.fromJson(
      {
        'code': 200,
        'data': {
          'data': [],
          'meta_data': {'total': 0}
        },
      },
      VideoItemResponseModel(),
    );
  }
}
