import 'package:an_core_network/an_core_network.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/index.dart';

abstract class VideosRepository {
  Future<Either<Failure, AppResponseListResult<VideoItemResponseModel>>> getVideos({required GetVideosRequestModel model});
}
