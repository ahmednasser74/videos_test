import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:an_core_log/app_logger.dart';
import 'package:an_core_network/an_core_network.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';
import 'package:videos_test/core/index.dart';

import 'dependency_init.config.dart';

final GetIt di = GetIt.instance;

@InjectableInit(
  usesNullSafety: true,
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> configureDependencies() async {
  di.registerLazySingleton<Network>(() => NetworkImpl(AppLogger(isProduction: false)));
  await dotenv.load(fileName: ".env");

  return $initGetIt(di);
}
// void _core() {
//   di.registerLazySingleton<ReceivePort>(() => ReceivePort());

//   di.registerLazySingleton<StreamController>(
//     () {
//       final stream = StreamController<dynamic>.broadcast();
//       di<ReceivePort>().listen((message) {
//         di<StreamController>().add(message);
//       });
//       return stream;
//     },
//   );
// }
