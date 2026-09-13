import 'exceptions.dart';

class PostalCodeResult {
  final String postalCode;
  final String area;
  final double latitude;
  final double longitude;

  PostalCodeResult({
    required this.postalCode,
    required this.area,
    required this.latitude,
    required this.longitude,
  });

  factory PostalCodeResult.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'postalCode': String parsedPostalCode,
        'area': String parsedArea,
        'latitude': num parsedLatitude,
        'longitude': num parsedLongitude,
      } =>
        PostalCodeResult(
          postalCode: parsedPostalCode,
          area: parsedArea,
          latitude: parsedLatitude.toDouble(),
          longitude: parsedLongitude.toDouble(),
        ),
      _ => throw PostalCodeException(
        'Payload failed pattern validation check!',
      ),
    };
  }
}
