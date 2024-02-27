import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CredentialStatus extends Equatable {}

class CredentialInit extends CredentialStatus {
  @override
  List<Object?> get props => [];
}

class CredentialLoading extends CredentialStatus {
  @override
  List<Object?> get props => [];
}

class CredentialPhoneAuthSmsCodeReceived extends CredentialStatus {
  @override
  List<Object?> get props => [];
}

class CredentialPhoneAuthProfileInfo extends CredentialStatus {
  @override
  List<Object?> get props => [];
}

class CredentialSuccess extends CredentialStatus {
  final String message;

  CredentialSuccess({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class CredentialFailed extends CredentialStatus {
  final String message;

  CredentialFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
