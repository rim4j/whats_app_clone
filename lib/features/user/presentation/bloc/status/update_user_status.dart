import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class UpdateUserStatus extends Equatable {}

class UpdateUserInit extends UpdateUserStatus {
  @override
  List<Object?> get props => [];
}

class UpdateUserLoading extends UpdateUserStatus {
  @override
  List<Object?> get props => [];
}

class UpdateUserSuccess extends UpdateUserStatus {
  @override
  List<Object?> get props => [];
}

class UpdateUserFailed extends UpdateUserStatus {
  @override
  List<Object?> get props => [];
}
