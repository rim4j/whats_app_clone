import 'package:whats_app_clone/features/user/domain/repositories/user_repository.dart';

class VerifyPhoneNumberUseCase {
  final UserRepository userRepository;
  VerifyPhoneNumberUseCase({
    required this.userRepository,
  });

  Future<void> call(String phoneNumber) async {
    return userRepository.verifyPhoneNumber(phoneNumber);
  }
}
