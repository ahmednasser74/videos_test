import 'package:flutter/material.dart';

import '../../features/videos/presentation/index.dart';

class Routes {
  static const String splashScreen = '/splashScreen', videoScreen = '/videoScreen', videoPlayerScreen = '/videoPlayerScreen';

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    try {
      return switch (routeSettings.name) {
        splashScreen => _screenInit(const SplashScreen(), routeSettings),
        videoPlayerScreen => _screenInit(VideoPlayerScreen(video: routeSettings.arguments as dynamic), routeSettings),
        videoScreen => _screenInit(const VideosScreen(), routeSettings),
        _ => throw UnimplementedError('Given Named Route is not implemented yet'),
      };
    } catch (error) {
      throw UnimplementedError('Something went wrong while navigation check routes file ${error.toString()}');
    }
  }

  static MaterialPageRoute<dynamic> _screenInit(Widget screen, RouteSettings? settings) {
    return MaterialPageRoute<dynamic>(builder: (_) => screen, settings: settings);
  }
}
