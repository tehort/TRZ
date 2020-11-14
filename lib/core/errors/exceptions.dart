class NoInternetAvailableException implements Exception {
  const NoInternetAvailableException();
  final String message = 'Verifique sua conexão com a internet';
}

class Failure implements Exception {
  Failure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}
