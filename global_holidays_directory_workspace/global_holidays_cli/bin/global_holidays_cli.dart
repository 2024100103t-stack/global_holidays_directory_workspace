import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'package:global_holidays_api/global_holidays_api.dart';
import 'package:global_holidays_cli/src/help_command.dart';
import 'package:global_holidays_cli/src/logging_config.dart';
import 'package:global_holidays_cli/src/query_command.dart';

Future<void> main() async {
  configureSystemTelemetry();

  final logger = Logger('GlobalHolidaysCLI');
  final httpClient = http.Client();

  // Put your Calendarific API key here.
  // Do NOT share this file publicly.
  const apiKey = '7BgmbEjhGd7wS3YUqLIVg4UuHd9TFLFw';

  final apiClient = GlobalHolidaysApiClient(
    httpClient,
    apiKey,
  );

  final commands = <String, dynamic>{
    'query': QueryCommand(),
    'help': HelpCommand(),
  };

  logger.info('Global Holidays CLI started.');

  try {
    print('Global Holidays Directory');
    print('Type "help" to see available commands.');
    print('Type "exit" to quit.');
    print('');

    while (true) {
      stdout.write('[global_holidays] > ');

      final input = stdin.readLineSync();

      if (input == null) {
        break;
      }

      final parts = input.trim().split(RegExp(r'\s+'));

      if (parts.isEmpty || parts.first.isEmpty) {
        continue;
      }

      final commandName = parts.first.toLowerCase();
      final arguments = parts.skip(1).toList();

      if (commandName == 'exit') {
        logger.info('User requested application exit.');
        break;
      }

      final command = commands[commandName];

      if (command == null) {
        print('Unknown command: $commandName');
        print('Type "help" for available commands.');
        continue;
      }

      await command.execute(
        apiClient,
        arguments,
      );
    }
  } finally {
    logger.info('Closing HTTP client.');
    httpClient.close();
  }

  logger.info('Global Holidays CLI terminated.');
}