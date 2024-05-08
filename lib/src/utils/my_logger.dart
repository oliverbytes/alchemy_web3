import 'package:logger/logger.dart';

final Logger _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 1,
    noBoxingByDefault: true,
  ),
  output: _SplitConsoleOutput(),
  filter: _LogFilter(),
);

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class MyLogger {
  /// class name
  final String _loggerTag;

  /// Level of logging we want to see, this can be useful to run tests in terminal without too much logs
  const MyLogger(
    this._loggerTag,
  );

  void error(dynamic event, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(
      '$_loggerTag: $event',
      error: error,
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }

  void warning(dynamic event) {
    _logger.w('$_loggerTag: $event');
  }

  void debug(dynamic event) {
    _logger.d('$_loggerTag: $event');
  }

  void trace(dynamic event) {
    _logger.i('$_loggerTag: $event');
  }
}

class _SplitConsoleOutput extends LogOutput {
  /// Maximum length per line in the log. Any logs larger than this length
  /// will be split into chunks and printed in sequence.
  /// Currently dart doesn't support printing logs more than 1020 characters.
  final int splitLength = 1000;

  /// Set to `false` to disable splitting, or leave `null`/`true` to retain the
  /// default behavior, which is to truncate the text.
  ///
  /// The default is true, so you only need to set it if you prefer to use a
  /// condition to determine whether to split or not per your build
  /// configuration.
  final bool enable = true;

  @override
  void output(OutputEvent event) {
    if (enable && event.lines.any(_isTooLong)) {
      for (var line in event.lines) {
        if (_isTooLong(line)) {
          final split = splitByLength(line, splitLength);
          split.forEach(_print);
        } else {
          _print(line);
        }
      }
    } else {
      event.lines.forEach(_print);
    }
    if (event.origin.stackTrace != null) {
      // ignore: avoid_print
      print(event.origin.stackTrace);
    }
  }

  void _print(String data) {
    var isReleaseMode = bool.fromEnvironment("dart.vm.product");
    if (!isReleaseMode) {
      print(data);
    }
  }

  List<String> splitByLength(String string, int length) {
    final chunks = <String>[];
    final stringLength = string.length;

    for (var i = 0; i < stringLength; i += length) {
      final end = (i + length < stringLength) ? i + length : stringLength;
      chunks.add(string.substring(i, end));
    }

    return chunks;
  }

  bool _isTooLong(String line) => line.length > splitLength;
}

final globalLogger = MyLogger('AlchemyGlobalLogger');
