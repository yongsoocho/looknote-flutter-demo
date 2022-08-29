import 'package:logger/logger.dart';

enum LogLevel {
  none,
  info,
  warning,
  error,
  verbose,
}

Logger logger({LogLevel level = LogLevel.info}) {
  return Logger(
      level: convertLogLevel(level),
      printer: PrefixPrinter(
        PrettyPrinter(
          methodCount: 1,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 100,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: true, // Should each log print contain a timestamp
        ),
        info: '[Look Note][I]',
        error: '[Look Note][E]',
        warning: '[Look Note][W]',
      ));
}

Level convertLogLevel(LogLevel level) {
  switch (level) {
    case LogLevel.error:
      return Level.error;
    case LogLevel.info:
      return Level.info;
    case LogLevel.none:
      return Level.nothing;
    case LogLevel.verbose:
      return Level.verbose;
    case LogLevel.warning:
      return Level.warning;
    default:
      return Level.nothing;
  }
}
