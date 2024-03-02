import 'package:whats_app_clone/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:whats_app_clone/features/user/data/data_sources/remote/user_remote_data_source_impl.dart';
import 'package:whats_app_clone/features/user/data/repositories/user_repositroy_impl.dart';
import 'package:whats_app_clone/features/user/domain/repositories/user_repository.dart';
import 'package:whats_app_clone/features/user/domain/usecases/credential/get_current_uid_usecase.dart';
import 'package:whats_app_clone/features/user/domain/usecases/credential/is_sign_in_usecase.dart';
import 'package:whats_app_clone/features/user/domain/usecases/credential/sign_in_with_phone_number_usecase.dart';
import 'package:whats_app_clone/features/user/domain/usecases/credential/sign_out_usecase.dart';
import 'package:whats_app_clone/features/user/domain/usecases/credential/verify_phone_number_usecase.dart';
import 'package:whats_app_clone/features/user/domain/usecases/user/create_user_usecase.dart';
import 'package:whats_app_clone/features/user/domain/usecases/user/get_all_users_usecase.dart';
import 'package:whats_app_clone/features/user/domain/usecases/user/get_device_number_usecase.dart';
import 'package:whats_app_clone/features/user/domain/usecases/user/get_single_user_usecase.dart';
import 'package:whats_app_clone/features/user/domain/usecases/user/update_user_usecase.dart';
import 'package:whats_app_clone/features/user/presentation/bloc/user_bloc.dart';
import 'package:whats_app_clone/locator.dart';

Future<void> userLocator() async {
  //data source
  locator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      fireStore: locator(),
      auth: locator(),
    ),
  );
  //repository
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userRemoteDataSource: locator(),
    ),
  );

  //use cases
  locator.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(userRepository: locator()));

  locator.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(userRepository: locator()));

  locator.registerLazySingleton<SignInWithPhoneNumber>(
      () => SignInWithPhoneNumber(userRepository: locator()));

  locator.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(userRepository: locator()));

  locator.registerLazySingleton<VerifyPhoneNumberUseCase>(
      () => VerifyPhoneNumberUseCase(userRepository: locator()));

  locator.registerLazySingleton<CreateUserUseCase>(
      () => CreateUserUseCase(userRepository: locator()));

  locator.registerLazySingleton<GetAllUsersUseCase>(
      () => GetAllUsersUseCase(userRepository: locator()));

  locator.registerLazySingleton<GetDeviceNumberUseCase>(
      () => GetDeviceNumberUseCase(userRepository: locator()));

  locator.registerLazySingleton<GetSingleUserUseCase>(
      () => GetSingleUserUseCase(userRepository: locator()));

  locator.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(userRepository: locator()));
  //blocs
  locator.registerFactory<UserBloc>(
    () => UserBloc(
      getCurrentUidUseCase: locator(),
      isSignInUseCase: locator(),
      signOutUseCase: locator(),
      createUserUseCase: locator(),
      signInWithPhoneNumber: locator(),
      verifyPhoneNumberUseCase: locator(),
      getDeviceNumberUseCase: locator(),
      getSingleUserUseCase: locator(),
      getAllUsersUseCase: locator(),
      updateUserUseCase: locator(),
    ),
  );
}
