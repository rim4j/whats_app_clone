import 'package:whats_app_clone/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:whats_app_clone/features/user/domain/entities/contact_entity.dart';
import 'package:whats_app_clone/features/user/domain/entities/user_entity.dart';
import 'package:whats_app_clone/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
  });

  @override
  Future<void> createUser(UserEntity user) async =>
      userRemoteDataSource.createUser(user);

  @override
  Stream<List<UserEntity>> getAllUsers() => userRemoteDataSource.getAllUsers();

  @override
  Future<String> getCurrentUid() async => userRemoteDataSource.getCurrentUid();

  @override
  Future<List<ContactEntity>> getDeviceNumber() async =>
      userRemoteDataSource.getDeviceNumber();

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) =>
      userRemoteDataSource.getSingleUser(uid);

  @override
  Future<bool> isSignIn() async => userRemoteDataSource.isSignIn();

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async =>
      userRemoteDataSource.signInWithPhoneNumber(smsPinCode);

  @override
  Future<void> signOut() async => userRemoteDataSource.signOut();

  @override
  Future<void> updateUser(UserEntity user) async =>
      userRemoteDataSource.updateUser(user);

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async =>
      userRemoteDataSource.verifyPhoneNumber(phoneNumber);
}
