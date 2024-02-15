import 'package:whats_app_clone/features/user/domain/entities/user_entity.dart';
import 'package:whats_app_clone/features/user/domain/repositories/user_repository.dart';

class GetSingleUserUseCase {
  final UserRepository userRepository;

  GetSingleUserUseCase({
    required this.userRepository,
  });
  Stream<List<UserEntity>> call(String uid) {
    return userRepository.getSingleUser(uid);
  }
}
