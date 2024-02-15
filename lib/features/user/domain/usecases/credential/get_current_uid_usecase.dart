import 'package:whats_app_clone/features/user/domain/repositories/user_repository.dart';

class GetCurrentUidUseCase {
  final UserRepository userRepository;

  GetCurrentUidUseCase({
    required this.userRepository,
  });

  Future<String> call() async {
    return userRepository.getCurrentUid();
  }
}
