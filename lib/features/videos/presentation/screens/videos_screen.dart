import 'package:an_core_bloc/an_core_bloc.dart';
import 'package:an_core_ui/an_core_ui.dart';
import 'package:flutter/material.dart';

import '../../../../core/index.dart';
import '../cubit/get_videos_cubit.dart';
import '../widgets/index.dart';

class VideosScreen extends BaseStatefulWidget {
  const VideosScreen({super.key});

  @override
  BaseState<VideosScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends BaseState<VideosScreen> {
  final videosCubit = di<GetVideosCubit>()..getVideos();

  @override
  String? get appBarTitle => 'Videos';

  @override
  Widget getBody(BuildContext context) {
    return BlocProvider<GetVideosCubit>(
      create: (_) => videosCubit,
      child: RequestBuilder<GetVideosCubit>(
        contentBuilder: (context, cubit, successState) {
          final videos = videosCubit.videos;
          final totalCount = videosCubit.totalPages;
          final isFinish = totalCount <= videosCubit.videos.length;
          return RefreshIndicator(
            onRefresh: () => videosCubit.refreshVideos(),
            child: AppLoadMoreWidget(
              isFinish: isFinish,
              textBuilder: (status) {
                if (status == LoadMoreStatus.idle) {
                  return 'Load more';
                } else if (status == LoadMoreStatus.loading) {
                  return 'Loading...';
                } else if (status == LoadMoreStatus.fail) {
                  return 'Error';
                } else {
                  return 'No more data';
                }
              },
              whenEmptyLoad: false,
              onLoadMore: () async {
                videosCubit.page++;
                await videosCubit.getVideos();
                return true;
              },
              child: ListView.separated(
                itemCount: videos.length,
                padding: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 14.h, bottom: .1.sh),
                separatorBuilder: (context, index) => SizedBox(height: 14.h),
                itemBuilder: (context, index) => VideoItemWidget(video: videos[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
