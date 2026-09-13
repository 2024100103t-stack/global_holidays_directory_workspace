# Global Holidays Directory

A Dart-based command-line application that retrieves and displays holiday information for different countries using the Calendarific API.

## Project Description

The **Global Holidays Directory** is a command-line application developed using Dart. It connects to the Calendarific API to retrieve holiday information for a selected country and displays the results through a simple command-line interface.

The project demonstrates API integration, JSON data processing, object-oriented programming, command-line interaction, error handling, logging, terminal styling, automated testing, and the organization of a Dart workspace with multiple packages.

## Objectives

The project aims to:

1. Retrieve holiday information from the Calendarific API.
2. Process and convert API JSON responses into Dart objects.
3. Provide a command-line interface for querying holiday information.
4. Allow users to search for holidays by country.
5. Implement error handling for API and network-related problems.
6. Use terminal colors to improve the command-line interface.
7. Implement logging for application activities and errors.
8. Organize the application using a Dart workspace with multiple packages.
9. Implement automated tests for the project components.

## Features

- Query holiday information from the Calendarific API.
- Search holidays by country code.
- Display holiday dates and names.
- Provide an interactive command-line interface.
- Handle API and network errors.
- Use terminal colors for improved output.
- Record application activities and errors through logging.
- Convert API JSON responses into Dart models.
- Provide help commands for users.
- Include automated tests.

## Technologies Used

- **Dart**
- **Calendarific API**
- **HTTP**
- **JSON**
- **Dart Testing Framework**
- **Logging**
- **ANSI Terminal Colors**
- **Git**
- **GitHub**
- **Visual Studio Code**

## Project Structure

```text
global_holidays_directory_workspace/
│
├── terminal_colors/
│   ├── lib/
│   │   ├── src/
│   │   │   ├── ansi.dart
│   │   │   └── terminal_colors_base.dart
│   │   ├── terminal_colors.dart
│   │   └── ...
│   ├── test/
│   └── pubspec.yaml
│
├── global_holidays_api/
│   ├── lib/
│   │   ├── src/
│   │   │   ├── client.dart
│   │   │   ├── exceptions.dart
│   │   │   ├── models.dart
│   │   │   └── ...
│   │   ├── global_holidays_api.dart
│   │   └── ...
│   ├── test/
│   ├── example/
│   └── pubspec.yaml
│
├── global_holidays_cli/
│   ├── bin/
│   │   └── global_holidays_cli.dart
│   ├── lib/
│   │   ├── src/
│   │   │   ├── command_base.dart
│   │   │   ├── help_command.dart
│   │   │   ├── logging_config.dart
│   │   │   └── query_command.dart
│   │   ├── global_holidays_cli.dart
│   │   └── ...
│   ├── test/
│   └── pubspec.yaml
│
├── pubspec.yaml
├── pubspec.lock
└── .gitignore
```

## Package Description

### terminal_colors

The `terminal_colors` package provides reusable ANSI terminal color constants and styling utilities used to improve the appearance of the command-line interface.

### global_holidays_api

The `global_holidays_api` package handles communication with the Calendarific API. It contains the API client, holiday data models, and exception handling for API-related errors.

### global_holidays_cli

The `global_holidays_cli` package provides the command-line interface of the application. It handles user commands, holiday queries, help commands, logging, and formatted terminal output.

## Requirements

Before running the project, make sure the following are installed:

- Dart SDK 3.12.2 or later
- Git
- Visual Studio Code or another Dart-compatible IDE
- Internet connection
- Calendarific API key

## Installation

Clone the repository:

```bash
git clone https://github.com/2024100103t-stack/global_holidays_directory_workspace.git
```

Navigate to the project directory:

```bash
cd global_holidays_directory_workspace
```

Get the project dependencies:

```bash
dart pub get
```

## API Configuration

The application uses the Calendarific API to retrieve holiday information.

An API key is required to access the Calendarific API.

Configure the API key using the appropriate environment or compile-time configuration used by the project.

Example:

```bash
dart run --define=CALENDARIFIC_API_KEY=YOUR_API_KEY
```

Replace:

```text
YOUR_API_KEY
```

with your actual Calendarific API key.

**Do not upload your real API key to GitHub.**

## How to Run

Navigate to the CLI package:

```bash
cd global_holidays_cli
```

Run the application:

```bash
dart run
```

The application will display the command-line interface:

```text
Global Holidays Directory
[global_holidays] >
```

## Example Usage

The application allows users to query holiday information by country.

Example command:

```text
[global_holidays] > query PH
```

Example output:

```text
--- GLOBAL HOLIDAYS REPORT ---

Country: PH

Date              Holiday
----------------------------------------
2026-01-01        New Year's Day
2026-04-02        Maundy Thursday
2026-04-03        Good Friday
...
```

The displayed holiday information is retrieved from the Calendarific API.

## Available Commands

### Query

Search for holidays using a country code.

```text
query PH
```

### Help

Display available commands and usage information.

```text
help
```

### Exit

Close the application.

```text
exit
```

## Logging

The application uses logging to record important application activities and errors.

Logging can help identify:

- API connection attempts
- API errors
- Network problems
- Application activities
- Other runtime issues

## Error Handling

The application implements exception handling for possible API and network-related problems.

Examples of errors that may be handled include:

- Invalid API responses
- Network connection errors
- API authentication errors
- Invalid country codes
- Missing API configuration

## Testing

The project includes automated tests for its packages and components.

To analyze the entire workspace:

```bash
dart analyze
```

To run the tests:

```bash
dart test
```

A successful analysis should display:

```text
No issues found!
```

## Dart Workspace

The project is organized as a Dart workspace containing multiple related packages:

```text
terminal_colors
global_holidays_api
global_holidays_cli
```

This structure allows the packages to be developed and managed together while keeping their responsibilities separated.

## Sample Workflow

The general workflow of the application is:

```text
User
  │
  ▼
Command-Line Interface
  │
  ▼
Query Command
  │
  ▼
Global Holidays API Client
  │
  ▼
Calendarific API
  │
  ▼
JSON Response
  │
  ▼
Dart Holiday Models
  │
  ▼
Formatted Holiday Report
  │
  ▼
Terminal Output
```

## Conclusion

The **Global Holidays Directory** demonstrates how Dart can be used to develop a command-line application that communicates with an external REST API.

The project provides practical experience in API integration, JSON processing, object-oriented programming, error handling, logging, terminal formatting, automated testing, and multi-package Dart workspace organization.

## Author

**Alanib, Maribel S.**

## Academic Project

This project was developed as part of an academic Dart programming project.
