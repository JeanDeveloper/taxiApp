import 'package:taxi/app/domain/entities/iuser.dart';

abstract class ILocalStorageRepository{
  Future<IUser?> getUser();
  Future<bool> saveUser(String uid);
  Future<void> saveStateCarousel(bool state);
  Future<bool> getStateCarousel();

  // Future<String> getToken();
  // Future<bool>   isDarkMode();
  // Future<bool>   saveDarkMode(bool darkMode);
  // Future<String> saveToken( String token );
} 