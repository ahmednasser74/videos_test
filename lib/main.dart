import 'package:flutter/material.dart';

import 'app.dart';
import 'core/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}
