import 'package:global_holidays_api/global_holidays_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class HelpCommand extends CliCommand {
  HelpCommand()
      : super(
          'help',
          'Displays available commands and their descriptions.',
        );

  @override
  Future<void> execute(
    GlobalHolidaysApiClient client,
    List<String> arguments,
  ) async {
    final buffer = StringBuffer()
      ..writeln('--- GLOBAL HOLIDAYS CLI ---'.styleHeader)
      ..writeln('Available commands:')
      ..writeln()
      ..writeln(
        'query <country> - Fetches holidays for a country.',
      )
      ..writeln(
        'help            - Displays this help information.',
      )
      ..writeln(
        'exit            - Exits the application.',
      )
      ..writeln('----------------------------'.styleHeader);

    print(buffer.toString());
  }
}