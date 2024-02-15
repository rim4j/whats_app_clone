import 'package:whats_app_clone/features/user/domain/repositories/user_repository.dart';

class IsSignInUseCase {
  final UserRepository userRepository;
  IsSignInUseCase({
    required this.userRepository,
  });

  Future<bool> call() async {
    return userRepository.isSignIn();
  }
}
