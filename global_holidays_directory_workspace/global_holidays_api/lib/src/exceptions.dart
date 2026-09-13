class GlobalHolidaysException implements Exception {
  final String message;
  final Object? cause;

  GlobalHolidaysException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return 'GlobalHolidaysException: $message (Underlying: $cause)';
    }

    return 'GlobalHolidaysException: $message';
  }
}