import 'package:an_core_network/an_core_network.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:videos_test/features/videos/data/models/request/get_videos_request_model.dart';
import 'package:videos_test/features/videos/data/models/response/video_item_response_model.dart';

import '../../domain/repositories/index.dart';
import '../datasource/index.dart';

@Injectable(as: VideosRepository)
class VideosRepositoryImp implements VideosRepository {
  final VideosRemoteDataSource _ordersRemoteDataSource;
  final VideosLocalDataSource _ordersLocalDataSource;
  VideosRepositoryImp(this._ordersRemoteDataSource, this._ordersLocalDataSource);

  @override
  Future<Either<Failure, AppResponseListResult<VideoItemResponseModel>>> getVideos({required GetVideosRequestModel model}) async {
    try {
      final isConnected = await InternetConnectionChecker.instance.hasConnection;
      if (isConnected) {
        final videos = await _ordersRemoteDataSource.getVideos(model: model);
        return Right(videos);
      } else {
        //todo check if cache not empty
        final videos = await _ordersLocalDataSource.getVideos();
        return Right(videos);
      }
    } on Exception catch (error) {
      return Left(FailureHandler(error).getExceptionFailure());
    }
  }
}
