import 'package:global_holidays_api/global_holidays_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class QueryCommand extends CliCommand {
  QueryCommand()
      : super(
          'query',
          'Fetches holidays for a specific country.',
        );

  @override
  Future<void> execute(
    GlobalHolidaysApiClient client,
    List<String> arguments,
  ) async {
    if (arguments.isEmpty) {
      print(
        'Execution Error: Country code is missing.'
            .styleError,
      );
      return;
    }

    final country = arguments.first;

    try {
      final holidays = await client.fetchHolidays(country);

      final buffer = StringBuffer()
        ..writeln(
          '--- GLOBAL HOLIDAYS REPORT ---'.styleHeader,
        )
        ..writeln(
          'Country: $country'.styleSuccess,
        );

      for (final holiday in holidays) {
        buffer.writeln(
          '${holiday.date} - ${holiday.name}',
        );
      }

      buffer.writeln(
        '-------------------------------'.styleHeader,
      );

      print(buffer.toString());
    } on GlobalHolidaysException catch (e) {
      print(
        'Operation Failed: ${e.message}'.styleError,
      );
    }
  }
}