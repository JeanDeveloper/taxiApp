import 'package:get_it/get_it.dart';
import 'package:taxi/driver/data/datasource/auth_datasource.dart';
import 'package:taxi/driver/data/repositories/firebase_auth_repository.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';
import 'package:taxi/driver/domain/usescase/verifing_otp.dart';
import 'package:taxi/driver/domain/usescase/sending_otp.dart';
import 'package:taxi/driver/presentation/blocs/auth/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //INJECTIONS FOR AUTH BLOC
  sl.registerLazySingleton(() => AuthBloc(sl(), sl()));
  sl.registerFactory<IAuthRepository>(() => FirebaseAuthRepository(sl()));
  sl.registerFactory<IAuthDataSource>(() =>  FirebaseDataSource());
  sl.registerFactory(() => SendingOTP(sl()));
  sl.registerFactory(() => VerifingOTP(sl()));

}