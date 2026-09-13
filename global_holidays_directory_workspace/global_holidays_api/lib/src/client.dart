import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'exceptions.dart';
import 'models.dart';

class GlobalHolidaysApiClient {
  final http.Client _client;
  final String _apiKey;

  final Logger _logger = Logger('GlobalHolidaysApiClient');

  static const String _authority = 'calendarific.com';

  GlobalHolidaysApiClient(
    this._client,
    this._apiKey,
  );

  Future<List<Holiday>> fetchHolidays(String country) async {
    _logger.info(
      'Initiating connection for country: $country',
    );

    final uri = Uri.https(
      _authority,
      '/api/v2/holidays',
      {
        'api_key': _apiKey,
        'country': country,
        'year': DateTime.now().year.toString(),
      },
    );

    try {
      final response = await _client
          .get(
            uri,
            headers: {
              'Accept': 'application/json',
            },
          )
          .timeout(
            const Duration(seconds: 5),
          );

      if (response.statusCode != 200) {
        _logger.warning(
          'API responded with status: ${response.statusCode}',
        );

        throw GlobalHolidaysException(
          'Remote server rejected transaction '
          '(HTTP ${response.statusCode}).',
        );
      }

      final decoded = json.decode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw GlobalHolidaysException(
          'Unexpected JSON response payload structure.',
        );
      }

      final responseData = decoded['response'];

      if (responseData is! Map<String, dynamic>) {
        throw GlobalHolidaysException(
          'Missing response data from API.',
        );
      }

      final holidaysData = responseData['holidays'];

      if (holidaysData is! List) {
        throw GlobalHolidaysException(
          'Holiday list is missing or invalid.',
        );
      }

      return holidaysData
          .whereType<Map<String, dynamic>>()
          .map(Holiday.fromJson)
          .toList();
    } on http.ClientException catch (e) {
      _logger.severe(
        'Network socket transaction failed.',
        e,
      );

      throw GlobalHolidaysException(
        'Network communication failure occurred.',
        e,
      );
    } catch (e) {
      _logger.severe(
        'Unexpected processing failure.',
        e,
      );

      rethrow;
    }
  }
}