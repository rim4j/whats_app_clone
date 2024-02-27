part of 'user_bloc.dart';

class UserState extends Equatable {
  final AuthStatus authStatus;
  final CredentialStatus credentialStatus;
  final GetDeviceNumberStatus getDeviceNumberStatus;
  final GetSingleUserStatus getSingleUserStatus;
  final GetAllUsersStatus getAllUsersStatus;
  final UpdateUserStatus updateUserStatus;

  const UserState(
      {required this.authStatus,
      required this.credentialStatus,
      required this.getDeviceNumberStatus,
      required this.getSingleUserStatus,
      required this.getAllUsersStatus,
      required this.updateUserStatus});

  UserState copyWith({
    AuthStatus? newAuthStatus,
    CredentialStatus? newCredentialStatus,
    GetDeviceNumberStatus? newGetDeviceNumberStatus,
    GetSingleUserStatus? newGetSingleUserStatus,
    GetAllUsersStatus? newGetAllUsersStatus,
    UpdateUserStatus? newUpdateUserStatus,
  }) {
    return UserState(
      authStatus: newAuthStatus ?? authStatus,
      credentialStatus: newCredentialStatus ?? credentialStatus,
      getDeviceNumberStatus: newGetDeviceNumberStatus ?? getDeviceNumberStatus,
      getSingleUserStatus: newGetSingleUserStatus ?? getSingleUserStatus,
      getAllUsersStatus: newGetAllUsersStatus ?? getAllUsersStatus,
      updateUserStatus: newUpdateUserStatus ?? updateUserStatus,
    );
  }

  @override
  List<Object?> get props => [
        authStatus,
        credentialStatus,
        getDeviceNumberStatus,
        getSingleUserStatus,
        getAllUsersStatus,
        updateUserStatus,
      ];
}
