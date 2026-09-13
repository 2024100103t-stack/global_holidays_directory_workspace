import 'exceptions.dart';

class Holiday {
  final String name;
  final String date;

  Holiday({
    required this.name,
    required this.date,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'date': {
          'iso': String date,
        },
      } =>
        Holiday(
          name: name,
          date: date,
        ),
      _ => throw GlobalHolidaysException(
          'Holiday payload failed pattern validation check!',
        ),
    };
  }
}