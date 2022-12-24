class NetworkException implements Exception {
  final String message;
  final String prefix;

  NetworkException({required this.message, required this.prefix});

  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException(String message)
      : super(message: message, prefix: "Error During Communication: ");
}

class BadRequestException extends NetworkException {
  BadRequestException(message)
      : super(message: message, prefix: "Invalid Request: ");
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException(message)
      : super(message: message, prefix: "Unauthorised: ");
}

class InvalidInputException extends NetworkException {
  InvalidInputException(String message)
      : super(message: message, prefix: "Invalid Input: ");
}
