import 'package:firebase_auth/firebase_auth.dart';

class ServerException implements Exception{}

class CacheException  implements Exception{}

class AuthException implements Exception{
  final String message;
  AuthException(this.message);
}

class LocationException implements Exception{
  final String message;
  LocationException(this.message);
}


class FbException implements Exception{
  final String message;
  FbException(this.message);
}


