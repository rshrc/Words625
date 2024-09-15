// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/level_provider.dart';
import 'package:words625/di/injection.dart';

final providers = [
  ChangeNotifierProvider<LessonProvider>(
    create: (_) => getIt<LessonProvider>(),
  ),
];
