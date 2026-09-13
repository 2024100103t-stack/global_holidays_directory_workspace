import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'exceptions.dart';
import 'models.dart';

class PostalCodeApiClient {
  final http.Client _client;
  final Logger _logger = Logger('PostalCodeApiClient');

  PostalCodeApiClient(this._client);

  Future<PostalCodeResult> fetchMetadata(String postalCode) async {
    _logger.info(
      'Initiating connection for postal code query: $postalCode',
    );

    // Temporary endpoint.
    // We will replace this with the actual postal-code API endpoint.
    final uri = Uri.https(
      'api.example.com',
      '/v1/postal-code/$postalCode',
    );

    try {
      final response = await _client
          .get(
            uri,
            headers: {
              'Accept': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode != 200) {
        _logger.warning(
          'API responded with error status: ${response.statusCode}',
        );

        throw PostalCodeException(
          'Remote server rejected transaction '
          '(HTTP ${response.statusCode}).',
        );
      }

      final decoded = json.decode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw PostalCodeException(
          'Unexpected JSON response payload structure.',
        );
      }

      return PostalCodeResult.fromJson(decoded);
    } on http.ClientException catch (e) {
      _logger.severe(
        'Network socket transaction failed.',
        e,
      );

      throw PostalCodeException(
        'Network communication failure occurred.',
        e,
      );
    } on PostalCodeException {
      rethrow;
    } catch (e) {
      _logger.severe(
        'An unexpected processing failure was intercepted.',
        e,
      );

      throw PostalCodeException(
        'Unexpected processing failure occurred.',
        e,
      );
    }
  }
}
