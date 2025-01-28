import 'package:an_core_bloc/an_core_bloc.dart';
import 'package:an_core_ui/an_core_ui.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/index.dart';
import '../cubit/get_videos_cubit.dart';
import '../widgets/index.dart';

class VideosScreen extends BaseStatefulWidget {
  const VideosScreen({super.key});

  @override
  BaseState<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends BaseState<VideosScreen> {
  final videosCubit = di<GetVideosCubit>()..getVideos();
  final PageController _pageController = PageController(viewportFraction: 1.0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
    Permission.storage.request().then((status) {
      if (!status.isGranted) {
        showSnackBar(title: 'By rejection you will not able to use offline mode');
      }
    });
  }

  void _onPageChanged() {
    // if ( _pageController.page! <= videosCubit.videos.length - 2) {
    //   videosCubit.getNextPage();
    // }
  }

  @override
  Widget getBody(BuildContext context) {
    return BlocProvider<GetVideosCubit>(
      create: (_) => videosCubit,
      child: SizedBox(
        height: double.infinity,
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
                  if (isFinish) return false;
                  await videosCubit.getNextPage();
                  return true;
                },
                child: PageView.builder(
                  itemCount: videos.length,
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) async {
                    if (index == videos.length - 2 && !isFinish) {
                      await videosCubit.getNextPage();
                    }
                  },
                  itemBuilder: (context, index) => VideoItemWidget(video: videos[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }
}
