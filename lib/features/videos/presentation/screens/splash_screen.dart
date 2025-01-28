import 'package:an_core_bloc/an_core_bloc.dart';
import 'package:an_core_network/an_core_network.dart';
import 'package:an_core_ui/an_core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/index.dart';

class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  BaseState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
    Future.delayed(
      const Duration(seconds: 1),
      // ignore: use_build_context_synchronously
      () => context.pushNamedReplacement(Routes.videoScreen),
    );
  }

  @override
  Widget getBody(BuildContext context) {
    return Center(
      child: Assets.images.appIcon.image(height: .5.sh, width: .5.sw),
    );
  }

  void init() {
    BaseRequestDefaults.instance.setBaseUrl(Constants.baseUrl);
    RequestBuilderInitializer.init(navigatorKey: di<GlobalKey<NavigatorState>>());
    RequestBuilderInitializer.initStrings(
      emptyTitle: 'No Data Founded',
      errorMessage: 'Something went wrong',
    );
  }
}
