
abstract class ILocalStorageRepository{
  Future<String> getUser();
  Future<bool> saveUser( String uid );
  Future<bool> saveStateCarousel( bool state );
  Future<bool> getStateCarousel();

  // Future<String> getToken();
  // Future<bool>   isDarkMode();
  // Future<bool>   saveDarkMode(bool darkMode);
  // Future<String> saveToken( String token );
}