import 'package:get_it/get_it.dart';
import 'package:taxi/driver/presentation/blocs/auth/auth_bloc.dart';

final sl = GetIt.instance;


Future<void> init() async {

  //INJECTIONS FOR AUTH BLOC
  sl.registerLazySingleton(() => AuthBloc());
  // sl.registerLazySingleton(() => AuthBloc(sl()));

}