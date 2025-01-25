import 'package:an_core_network/an_core_network.dart';
import 'package:videos_test/core/const/index.dart';
import '../models/index.dart';

class GetVideosRequest with Request, GetRequest {
  const GetVideosRequest(this.requestModel);

  @override
  final GetVideosRequestModel requestModel;

  @override
  String get path => EndPoints.videos;
}
