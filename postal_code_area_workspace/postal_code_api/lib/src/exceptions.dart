class PostalCodeException implements Exception {
  final String message;
  final Object? cause;

  PostalCodeException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return 'PostalCodeException: $message (Underlying: $cause)';
    }

    return 'PostalCodeException: $message';
  }
}
