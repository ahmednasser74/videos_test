import 'package:an_core_network/an_core_network.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/index.dart';
import '../../data/index.dart';
import '../repositories/videos_repository.dart';

@Injectable()
class GetVideosUseCase extends UseCase<Future<Either<Failure, AppResponseListResult<VideoItemResponseModel>>>, GetVideosRequestModel> {
  final VideosRepository repository;

  GetVideosUseCase(this.repository);

  @override
  Future<Either<Failure, AppResponseListResult<VideoItemResponseModel>>> call({
    required GetVideosRequestModel params,
  }) async {
    return await repository.getVideos(model: params);
  }
}
