import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_app_clone/features/user/domain/entities/user_entity.dart';
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
import 'package:whats_app_clone/features/user/presentation/bloc/status/auth_status.dart';
import 'package:whats_app_clone/features/user/presentation/bloc/status/credential_status.dart';
import 'package:whats_app_clone/features/user/presentation/bloc/status/get_device_number_status.dart';
import 'package:whats_app_clone/features/user/presentation/bloc/status/get_single_user_status.dart';
import 'package:whats_app_clone/features/user/presentation/bloc/status/update_user_status.dart';
import 'package:whats_app_clone/features/user/presentation/bloc/status/users_status.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;
  //credentials
  final SignInWithPhoneNumber signInWithPhoneNumber;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  final CreateUserUseCase createUserUseCase;
  //device number
  final GetDeviceNumberUseCase getDeviceNumberUseCase;
  //get single user
  final GetSingleUserUseCase getSingleUserUseCase;
  //get all users
  final GetAllUsersUseCase getAllUsersUseCase;
  //update user
  final UpdateUserUseCase updateUserUseCase;

  UserBloc({
    required this.getCurrentUidUseCase,
    required this.isSignInUseCase,
    required this.signOutUseCase,
    required this.createUserUseCase,
    required this.signInWithPhoneNumber,
    required this.verifyPhoneNumberUseCase,
    required this.getDeviceNumberUseCase,
    required this.getSingleUserUseCase,
    required this.getAllUsersUseCase,
    required this.updateUserUseCase,
  }) : super(UserState(
          authStatus: AuthInit(),
          credentialStatus: CredentialInit(),
          getDeviceNumberStatus: GetDeviceNumberInit(),
          getSingleUserStatus: GetSingleUserInit(),
          getAllUsersStatus: GetAllUsersInit(),
          updateUserStatus: UpdateUserInit(),
        )) {
    //events
    //!auth
    on<AppStartedEvent>(_onAppStartedEvent);
    on<LoggedOutEvent>(_onLoggedOutEvent);
    //!credential
    on<SubmitVerifyPhoneNumberEvent>(_onSubmitVerifyPhoneNumber);
    on<SubmitProfileInfoEvent>(_onSubmitProfileInfo);
    on<SubmitSmsCodeEvent>(_onSubmitSmsCode);
    //!get device number
    on<GetDeviceNumberEvent>(_onGetDeviceNumberEvent);
    //!get single user
    on<GetSingleUserEvent>(_onGetSingleUserEvent);
    //!get all users
    on<GetAllUsersEvent>(_onGetAllUsersEvent);
    //!update user
    on<UpdateUserEvent>(_onUpdateUserEvent);
  }

  //authentication
  void _onAppStartedEvent(
    AppStartedEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      final bool isSignIn = await isSignInUseCase();
      if (isSignIn) {
        final uid = await getCurrentUidUseCase();

        emit(state.copyWith(newAuthStatus: Authenticated(uid: uid)));
      } else {
        emit(state.copyWith(newAuthStatus: Unauthenticated()));
      }
    } catch (e) {
      emit(state.copyWith(newAuthStatus: Unauthenticated()));
    }
  }

  void _onLoggedOutEvent(
    LoggedOutEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      await signOutUseCase();
      emit(state.copyWith(newAuthStatus: Unauthenticated()));
      emit(state.copyWith(
          newCredentialStatus:
              CredentialFailed(message: "you have been signed out")));
    } catch (e) {
      emit(state.copyWith(newAuthStatus: Unauthenticated()));
      emit(state.copyWith(
          newCredentialStatus:
              CredentialFailed(message: "you have been signed out")));
    }
  }

  //credentials
  void _onSubmitVerifyPhoneNumber(
    SubmitVerifyPhoneNumberEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      await verifyPhoneNumberUseCase(event.phoneNumber);
      emit(state.copyWith(
          newCredentialStatus: CredentialPhoneAuthSmsCodeReceived()));
    } on SocketException catch (_) {
      emit(
        state.copyWith(
          newCredentialStatus: CredentialFailed(message: "credential failed"),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          newCredentialStatus: CredentialFailed(message: "credential failed"),
        ),
      );
    }
  }

  void _onSubmitProfileInfo(
    SubmitProfileInfoEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      await createUserUseCase(event.userEntity);
      emit(
        state.copyWith(
            newCredentialStatus: CredentialSuccess(
                message: "Welcome, your registration was successful")),
      );
    } on SocketException catch (_) {
      emit(
        state.copyWith(
            newCredentialStatus:
                CredentialFailed(message: "credential failed")),
      );
    } catch (e) {
      emit(
        state.copyWith(
            newCredentialStatus:
                CredentialFailed(message: "credential failed")),
      );
    }
  }

  void _onSubmitSmsCode(
    SubmitSmsCodeEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      await signInWithPhoneNumber(event.smsCode);
      emit(state.copyWith(
          newCredentialStatus: CredentialPhoneAuthProfileInfo()));
    } on SocketException catch (_) {
      emit(
        state.copyWith(
            newCredentialStatus:
                CredentialFailed(message: "credential failed")),
      );
    } catch (e) {
      emit(
        state.copyWith(
            newCredentialStatus:
                CredentialFailed(message: "credential failed")),
      );
    }
  }

  //get device number
  void _onGetDeviceNumberEvent(
    GetDeviceNumberEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      final contacts = await getDeviceNumberUseCase();

      emit(state.copyWith(
        newGetDeviceNumberStatus: GetDeviceNumberSuccess(contacts: contacts),
      ));
    } catch (e) {
      emit(state.copyWith(newGetDeviceNumberStatus: GetDeviceNumberFailed()));
    }
  }

  //stream get single user
  void _onGetSingleUserEvent(
    GetSingleUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(newGetSingleUserStatus: GetSingleUserLoading()));
    final streamRes = getSingleUserUseCase(event.uid);

    await emit.forEach(streamRes, onData: (dynamic data) {
      final List<UserEntity> user = data;

      return state.copyWith(
          newGetSingleUserStatus: GetSingleUserSuccess(singleUser: user.first));
    }).catchError((e) {
      emit(state.copyWith(newGetSingleUserStatus: GetSingleUserFailed()));
    });
  }

  //stream get all users
  void _onGetAllUsersEvent(
    GetAllUsersEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(newGetAllUsersStatus: GetAllUsersLoading()));

    final streamRes = getAllUsersUseCase();

    await emit.forEach(streamRes, onData: (dynamic data) {
      final List<UserEntity> users = data;

      return state.copyWith(
          newGetAllUsersStatus: GetAllUsersSuccess(users: users));
    }).catchError((e) {
      state.copyWith(newGetAllUsersStatus: GetAllUsersFailed());
    });
  }

  //update user
  void _onUpdateUserEvent(
    UpdateUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(newUpdateUserStatus: UpdateUserLoading()));
    try {
      await updateUserUseCase(event.user);
      emit(state.copyWith(newUpdateUserStatus: UpdateUserSuccess()));
    } catch (e) {
      emit(state.copyWith(newUpdateUserStatus: UpdateUserFailed()));
    }
  }
}
