import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:whats_app_clone/features/user/domain/entities/contact_entity.dart';

@immutable
abstract class GetDeviceNumberStatus extends Equatable {}

class GetDeviceNumberInit extends GetDeviceNumberStatus {
  @override
  List<Object?> get props => [];
}

class GetDeviceNumberLoading extends GetDeviceNumberStatus {
  @override
  List<Object?> get props => [];
}

class GetDeviceNumberSuccess extends GetDeviceNumberStatus {
  final List<ContactEntity> contacts;

  GetDeviceNumberSuccess({
    required this.contacts,
  });

  @override
  List<Object?> get props => [contacts];
}

class GetDeviceNumberFailed extends GetDeviceNumberStatus {
  @override
  List<Object?> get props => [];
}
