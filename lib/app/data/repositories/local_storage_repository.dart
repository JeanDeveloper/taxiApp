import 'package:taxi/app/data/datasource/local_storage_datasource.dart';
import 'package:taxi/app/domain/repositories/ilocal_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalStorageRepository extends ILocalStorageRepository{
  
  final ILocalStorageDataSource localStorageDataSource;
  LocalStorageRepository(this.localStorageDataSource);

  final _carouselState  = "carousel-state";

  @override
  Future<bool> getStateCarousel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final state = preferences.getBool( _carouselState );
    return state ?? false;
  }

  @override
  Future<bool> saveStateCarousel(bool state) async  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(_carouselState, state);
    return true;
  }

  @override
  Future<String> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }


  @override
  Future<bool> saveUser(String uid) {
    // TODO: implement saveToken
    throw UnimplementedError();
  }

}