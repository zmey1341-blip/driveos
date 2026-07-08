import 'package:flutter/material.dart';

class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalException;

  AppException({
    required this.message,
    this.code,
    this.originalException,
  });

  @override
  String toString() => 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

class NetworkException extends AppException {
  NetworkException({required String message, String? code})
      : super(message: message, code: code ?? 'NETWORK_ERROR');
}

class AuthenticationException extends AppException {
  AuthenticationException({required String message, String? code})
      : super(message: message, code: code ?? 'AUTH_ERROR');
}

class StorageException extends AppException {
  StorageException({required String message, String? code})
      : super(message: message, code: code ?? 'STORAGE_ERROR');
}

class ValidationException extends AppException {
  ValidationException({required String message, String? code})
      : super(message: message, code: code ?? 'VALIDATION_ERROR');
}
