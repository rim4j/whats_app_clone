import 'package:whats_app_clone/features/user/domain/repositories/user_repository.dart';

class SignOutUseCase {
  final UserRepository userRepository;

  SignOutUseCase({
    required this.userRepository,
  });

  Future<void> call() async {
    return userRepository.signOut();
  }
}
