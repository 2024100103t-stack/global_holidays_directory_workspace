import 'package:test/test.dart';
import 'package:global_holidays_api/global_holidays_api.dart';

void main() {
  group('Holiday Model Deserialisation Suite', () {
    test('Successful parsing of holiday data', () {
      final mockJson = {
        'name': 'New Year’s Day',
        'description': 'First day of the year.',
        'date': {
          'iso': '2026-01-01',
          'datetime': {
            'year': 2026,
            'month': 1,
            'day': 1,
          },
        },
        'type': ['National holiday'],
      };

      final holiday = Holiday.fromJson(mockJson);

      expect(holiday.name, equals('New Year’s Day'));
      expect(holiday.date, equals('2026-01-01'));
    });

    test('Throws custom exception on invalid data', () {
      final malformedJson = {
        'name': 'Invalid Holiday',
      };

      expect(
        () => Holiday.fromJson(malformedJson),
        throwsA(isA<GlobalHolidaysException>()),
      );
    });
  });
}