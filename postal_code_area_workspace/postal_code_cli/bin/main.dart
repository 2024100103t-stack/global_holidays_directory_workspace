import 'package:http/http.dart' as http;
import 'package:postal_code_api/postal_code_api.dart';
import 'package:postal_code_cli/src/logging_config.dart';
import 'package:postal_code_cli/src/query_command.dart';

Future<void> main(List<String> arguments) async {
  configureSystemTelemetry();

  final client = PostalCodeApiClient(http.Client());

  final command = QueryCommand();

  if (arguments.isEmpty) {
    print('Usage: dart run bin/main.dart query <postal-code>');
    print('');
    print('Example:');
    print('  dart run bin/main.dart query 5300');
    return;
  }

  final commandName = arguments.first;
  final commandArguments = arguments.skip(1).toList();

  if (commandName == 'query') {
    await command.execute(client, commandArguments);
  } else {
    print('Unknown command: $commandName');
    print('');
    print('Usage: dart run bin/main.dart query <postal-code>');
  }
}