import 'package:terminal_colors/terminal_colors.dart';
import 'package:postal_code_api/postal_code_api.dart';

import 'command_base.dart';

class QueryCommand extends CliCommand {
  QueryCommand()
      : super(
          'query',
          'Fetches information for a postal code.',
        );

  @override
  Future<void> execute(
    PostalCodeApiClient client,
    List<String> arguments,
  ) async {
    if (arguments.isEmpty) {
      print(
        'Execution Error: Postal code is missing.'.styleError,
      );
      return;
    }

    final postalCode = arguments.first;

    try {
      final result = await client.fetchMetadata(postalCode);

      final buffer = StringBuffer()
        ..writeln('--- POSTAL CODE AREA REPORT ---'.styleHeader)
        ..writeln('Postal Code: ${result.postalCode}'.styleSuccess)
        ..writeln('Area:        ${result.area}')
        ..writeln('Latitude:    ${result.latitude}')
        ..writeln('Longitude:   ${result.longitude}')
        ..writeln('--------------------------------');

      print(buffer.toString());
    } on PostalCodeException catch (e) {
      print(
        'Operation Failed: ${e.message}'.styleError,
      );
    }
  }
}