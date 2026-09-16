[README (1).md](https://github.com/user-attachments/files/32288195/README.md)
# Global Holidays Directory

A small Dart workspace for looking up public holidays by country, built on the [Calendarific](https://calendarific.com/) API.

The workspace is split into three packages:

| Package | What it does |
|---|---|
| [`global_holidays_api`](./global_holidays_api) | Client library. Wraps the Calendarific `/holidays` endpoint and parses responses into `Holiday` objects. |
| [`global_holidays_cli`](./global_holidays_cli) | Interactive command-line REPL built on top of the API package. |
| [`terminal_colors`](./terminal_colors) | Tiny standalone ANSI text-styling helper (headers, success/warning/error text) used by the CLI. |

## Usage

Set your Calendarific API key as an environment variable, then run the CLI:

```bash
export CALENDARIFIC_API_KEY=your_key_here
dart run global_holidays_cli
```

Inside the REPL:

```
Global Holidays Directory
Type "help" to see available commands.
Type "exit" to quit.

[global_holidays] > query US
--- GLOBAL HOLIDAYS REPORT ---
Country: US
2026-01-01 - New Year's Day
...
-------------------------------

[global_holidays] > help
[global_holidays] > exit
```

## Using the API package directly

```dart
import 'package:http/http.dart' as http;
import 'package:global_holidays_api/global_holidays_api.dart';

Future<void> main() async {
  final client = GlobalHolidaysApiClient(http.Client(), 'YOUR_API_KEY');
  final holidays = await client.fetchHolidays('US');

  for (final holiday in holidays) {
    print('${holiday.date} — ${holiday.name}');
  }
}
```

## Project structure

```
global_holidays_directory_workspace/
├── global_holidays_api/   # Calendarific client library
├── global_holidays_cli/   # Interactive CLI
└── terminal_colors/       # ANSI styling helper
```

This is a Dart pub **workspace** (see the root `pubspec.yaml`), so all three packages resolve against each other locally without needing to be published.

## Setup

```bash
dart pub get
dart test               # run tests in each package
```

## ⚠️ Before publishing this repo

`global_holidays_cli/bin/global_holidays_cli.dart` currently contains a **hardcoded Calendarific API key**. Rotate/revoke that key and either delete this file or update it to read from `CALENDARIFIC_API_KEY` like `lib/global_holidays_cli.dart` already does, and add a root `.gitignore` before pushing.

## License

_Add a license here (e.g. MIT) before publishing._
