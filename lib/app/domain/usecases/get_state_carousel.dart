import 'package:taxi/app/domain/repositories/ilocal_storage_repository.dart';

class GetStateCarousel{

  final ILocalStorageRepository localRepository;
  GetStateCarousel(this.localRepository);

  Future<bool> call() async {
    final state = await localRepository.getStateCarousel();
    return state;
  }

}