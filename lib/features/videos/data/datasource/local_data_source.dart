import 'package:an_core_network/an_core_network.dart';
import 'package:injectable/injectable.dart';

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
    // final response = await network.send(
    //   request: GetVideosRequest(),
    //   responseObject: VideoItemResponseModel(),
    //   responseType: ResponseType.list,
    // );
    return 'response' as AppResponseListResult<VideoItemResponseModel>;
  }
}
