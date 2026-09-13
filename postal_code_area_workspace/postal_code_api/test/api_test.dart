import 'package:postal_code_api/postal_code_api.dart';
import 'package:test/test.dart';

void main() {
  group('Postal Code Model Tests', () {
    test('Successfully parses valid postal code data', () {
      final mockJson = {
        'postalCode': '5300',
        'area': 'Puerto Princesa',
        'latitude': 9.7392,
        'longitude': 118.7353,
      };

      final result = PostalCodeResult.fromJson(mockJson);

      expect(result.postalCode, equals('5300'));
      expect(result.area, equals('Puerto Princesa'));
      expect(result.latitude, equals(9.7392));
      expect(result.longitude, equals(118.7353));
    });

    test('Throws exception when required data is missing', () {
      final malformedJson = {
        'postalCode': '5300',
      };

      expect(
        () => PostalCodeResult.fromJson(malformedJson),
        throwsA(isA<PostalCodeException>()),
      );
    });
  });
}
