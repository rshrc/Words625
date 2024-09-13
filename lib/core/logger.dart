// Package imports:

// Package imports:
import 'package:logger/logger.dart';

final logsPermissions = ['dev', 'test'];

/// Logging will only be enabled in dev servers for debugging
final logger = Logger(
  printer: PrettyPrinter(),
  filter: EnableLogging(),
);

/// Class which enables logging everywhere
class EnableLogging extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
