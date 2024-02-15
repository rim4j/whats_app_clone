import 'package:whats_app_clone/features/user/domain/repositories/user_repository.dart';

class SignInWithPhoneNumber {
  final UserRepository userRepository;

  SignInWithPhoneNumber({
    required this.userRepository,
  });

  Future<void> call(String smsPinCode) async {
    return userRepository.signInWithPhoneNumber(smsPinCode);
  }
}
