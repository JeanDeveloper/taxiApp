import 'package:taxi/app/domain/repositories/ilocal_storage_repository.dart';

class SaveStateCarousel{

  final ILocalStorageRepository localRepository;
  SaveStateCarousel(this.localRepository);

  Future<void> call(bool state) async {
    await localRepository.saveStateCarousel(state);
  }

}