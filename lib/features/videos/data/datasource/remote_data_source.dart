import 'package:an_core_network/an_core_network.dart';
import 'package:injectable/injectable.dart';
import '../index.dart';

abstract class VideosRemoteDataSource {
  Future<AppResponseListResult<VideoItemResponseModel>> getVideos({required GetVideosRequestModel model});
}

@Injectable(as: VideosRemoteDataSource)
class VideosRemoteDataSourceImpl implements VideosRemoteDataSource {
  final Network network;
  VideosRemoteDataSourceImpl({required this.network});

  @override
  Future<AppResponseListResult<VideoItemResponseModel>> getVideos({required GetVideosRequestModel model}) async {
    final response = await network.send(
      request: GetVideosRequest(model),
      responseObject: VideoItemResponseModel(),
      responseType: ResponseType.list,
    );
    return response as AppResponseListResult<VideoItemResponseModel>;
  }
}
