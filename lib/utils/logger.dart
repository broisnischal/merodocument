import 'package:logger/web.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);
