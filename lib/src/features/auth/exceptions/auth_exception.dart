// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AuthException(this.message, this.stackTrace);

  @override
  String toString() =>
      'AuthException(message: $message, stackTrace: $stackTrace)';
}
