import 'package:postal_code_api/postal_code_api.dart';

abstract class CliCommand {
  final String name;
  final String description;

  CliCommand(this.name, this.description);

  Future<void> execute(
    PostalCodeApiClient client,
    List<String> arguments,
  );
}