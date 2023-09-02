import 'package:get_it/get_it.dart';
import 'package:taxi/driver/data/datasource/auth_datasource.dart';
import 'package:taxi/driver/data/repositories/firebase_auth_repository.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';
import 'package:taxi/driver/domain/usescase/verify_number.dart';
import 'package:taxi/driver/presentation/blocs/auth/auth_bloc.dart';

final sl = GetIt.instance;


Future<void> init() async {

  //INJECTIONS FOR AUTH BLOC
  sl.registerLazySingleton(() => AuthBloc(sl()));
  sl.registerFactory(() => VerifyNumber(sl()));
  sl.registerFactory<IAuthRepository>(() => FirebaseAuthRepository(sl()));
  sl.registerFactory<IAuthDataSource>(() =>  FirebaseDataSource());

  // sl.registerLazySingleton(() => AuthBloc(sl()));

}