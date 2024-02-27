import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:whats_app_clone/features/user/domain/entities/user_entity.dart';

@immutable
abstract class GetSingleUserStatus extends Equatable {}

class GetSingleUserInit extends GetSingleUserStatus {
  @override
  List<Object?> get props => [];
}

class GetSingleUserLoading extends GetSingleUserStatus {
  @override
  List<Object?> get props => [];
}

class GetSingleUserSuccess extends GetSingleUserStatus {
  final UserEntity singleUser;

  GetSingleUserSuccess({
    required this.singleUser,
  });

  @override
  List<Object?> get props => [singleUser];
}

class GetSingleUserFailed extends GetSingleUserStatus {
  @override
  List<Object?> get props => [];
}
