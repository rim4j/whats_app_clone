import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:whats_app_clone/features/user/domain/entities/user_entity.dart';

@immutable
abstract class GetAllUsersStatus extends Equatable {}

class GetAllUsersInit extends GetAllUsersStatus {
  @override
  List<Object?> get props => [];
}

class GetAllUsersLoading extends GetAllUsersStatus {
  @override
  List<Object?> get props => [];
}

class GetAllUsersSuccess extends GetAllUsersStatus {
  final List<UserEntity> users;

  GetAllUsersSuccess({
    required this.users,
  });

  @override
  List<Object?> get props => [users];
}

class GetAllUsersFailed extends GetAllUsersStatus {
  @override
  List<Object?> get props => [];
}
