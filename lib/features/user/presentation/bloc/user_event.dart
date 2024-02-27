part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {}

class AppStartedEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class LoggedOutEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends UserEvent {
  final UserEntity userEntity;

  LoginEvent({
    required this.userEntity,
  });

  @override
  List<Object?> get props => [];
}

class SubmitVerifyPhoneNumberEvent extends UserEvent {
  final String phoneNumber;

  SubmitVerifyPhoneNumberEvent({
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [phoneNumber];
}

class SubmitSmsCodeEvent extends UserEvent {
  final String smsCode;

  SubmitSmsCodeEvent({
    required this.smsCode,
  });

  @override
  List<Object?> get props => [smsCode];
}

class SubmitProfileInfoEvent extends UserEvent {
  final UserEntity userEntity;

  SubmitProfileInfoEvent({
    required this.userEntity,
  });

  @override
  List<Object?> get props => [userEntity];
}

class GetDeviceNumberEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class GetSingleUserEvent extends UserEvent {
  final String uid;

  GetSingleUserEvent({
    required this.uid,
  });

  @override
  List<Object?> get props => [uid];
}

class GetAllUsersEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUserEvent extends UserEvent {
  final UserEntity user;

  UpdateUserEvent({required this.user});

  @override
  List<Object?> get props => [user];
}
