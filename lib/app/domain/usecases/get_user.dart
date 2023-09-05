import 'package:taxi/app/domain/entities/iuser.dart';
import 'package:taxi/app/domain/repositories/ilocal_storage_repository.dart';

class GetUser{

  final ILocalStorageRepository localStorageRepository;
  GetUser(this.localStorageRepository);

  Future<IUser?> call() async {
    IUser? user = await localStorageRepository.getUser();
    return user;
  }

}