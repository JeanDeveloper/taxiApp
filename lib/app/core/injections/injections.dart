import 'package:get_it/get_it.dart';
import 'package:taxi/app/data/datasource/local_storage_datasource.dart';
import 'package:taxi/app/data/repositories/geolocator_repository.dart';
import 'package:taxi/app/data/repositories/local_storage_repository.dart';
import 'package:taxi/app/domain/repositories/ilocal_storage_repository.dart';
import 'package:taxi/app/domain/repositories/ilocation_repository.dart';
import 'package:taxi/app/domain/usecases/get_state_carousel.dart';
import 'package:taxi/app/domain/usecases/get_user.dart';
import 'package:taxi/app/domain/usecases/save_state_carousel.dart';
import 'package:taxi/app/domain/usecases/sending_otp.dart';
import 'package:taxi/app/domain/usecases/verifing_otp.dart';
import 'package:taxi/app/presentation/blocs/auth/auth_bloc.dart';
import 'package:taxi/app/presentation/blocs/location/location_bloc.dart';
import 'package:taxi/driver/data/datasource/auth_datasource.dart';
import 'package:taxi/driver/data/datasource/location_datasource.dart';
import 'package:taxi/driver/data/datasource/register_datasource.dart';
import 'package:taxi/driver/data/repositories/firebase_auth_repository.dart';
import 'package:taxi/driver/data/repositories/firebase_register_repository.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';
import 'package:taxi/driver/domain/repositories/iregister_repository.dart';
import 'package:taxi/driver/domain/usecases/get_colors.dart';
import 'package:taxi/driver/domain/usecases/get_models.dart';
import 'package:taxi/driver/presentation/blocs/color/color_bloc.dart';
import 'package:taxi/driver/presentation/blocs/register/model_bloc.dart';
final sl = GetIt.instance;

Future<void> init() async {

  //INJECTIONS FOR AUTH BLOC
  sl.registerLazySingleton(() => AuthBloc(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory<IAuthRepository>(() => FirebaseAuthRepository(sl()));
  sl.registerFactory<IAuthDataSource>(() =>  FirebaseDataSource());
  sl.registerFactory(() => SendingOTP(sl()));
  sl.registerFactory(() => VerifingOTP(sl()));
  
  sl.registerFactory<ILocalStorageRepository>(() => LocalStorageRepository(sl()));
  sl.registerFactory<ILocalStorageDataSource>(() => LocalStorageDataSource());
  sl.registerFactory(() => GetUser(sl()));
  sl.registerFactory(() => GetStateCarousel(sl()));
  sl.registerFactory(() => SaveStateCarousel(sl()));

  //REGISTER BLOC
  sl.registerLazySingleton(() => ModelBloc(sl()));
  sl.registerLazySingleton(() => ColorBloc(sl()));

  sl.registerFactory<IRegisterDataSource>(() =>  RegisterDataSource());
  sl.registerFactory<IRegisterRepository>(() => FirebaseRegisterRepository(sl()));
  sl.registerFactory(() => GetModels(sl()));
  sl.registerFactory(() => GetColors(sl()));

  sl.registerFactory<ILocationDataSource>(() =>  GoogleMapsDataSource());
  sl.registerFactory<ILocationRepository>(() =>  GeolocatorLocationRepository(sl()));
  sl.registerLazySingleton(() => LocationBloc(sl()));

}