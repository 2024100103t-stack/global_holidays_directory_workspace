import 'package:global_holidays_api/global_holidays_api.dart';

abstract class CliCommand {
  final String name;
  final String description;

  CliCommand(this.name, this.description);

  Future<void> execute(
    GlobalHolidaysApiClient client,
    List<String> arguments,
  );
}