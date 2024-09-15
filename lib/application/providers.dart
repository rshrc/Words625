// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/level_provider.dart';

final providers = [
  ChangeNotifierProvider<LessonProvider>(
    create: (_) => LessonProvider(),
  ),
];
