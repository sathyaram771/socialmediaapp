class AppException implements Exception {
  final String message;
  AppException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException() : super("Network error occurred");
}

class TimeoutException extends AppException {
  TimeoutException() : super("Request timed out");
}

class InvalidResponseException extends AppException {
  InvalidResponseException() : super("Invalid response received");
}
