class APiException implements Exception {
  final String message;
  final int? statusCode;

  APiException({required this.message, this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';
}
