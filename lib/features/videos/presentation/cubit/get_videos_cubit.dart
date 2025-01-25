import 'package:an_core_bloc/an_core_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:videos_test/features/videos/data/index.dart';

import '../../domain/usecase/index.dart';

@Injectable()
class GetVideosCubit extends Cubit<FlowState> {
  final GetVideosUseCase _getVideosUseCase;

  GetVideosCubit(this._getVideosUseCase) : super(const ContentState());

  int totalPages = 1;
  int page = 1;
  final List<VideoItemResponseModel> videos = [];

  Future<void> getVideos() async {
    if (page == 1) {
      safeEmit(const LoadingState(type: LoadingRendererType.content));
    }
    final requestModel = GetVideosRequestModel(page: page);
    final home = await _getVideosUseCase(params: requestModel);
    home.fold(
      (failure) {
        safeEmit(ErrorState(type: ErrorRendererType.content, message: failure.message));
      },
      (r) {
        if (r.isSuccess ?? false) {
          totalPages = r.totalPages;
          videos.addAll(r.results as List<VideoItemResponseModel>);
          safeEmit(SuccessState(type: SuccessRendererType.none, data: r.results));
        } else {
          safeEmit(ErrorState(type: ErrorRendererType.content, message: r.message));
        }
      },
    );
  }

  Future<void> refreshVideos() async {
    page = 1;
    videos.clear();
    await getVideos();
  }
}
