import 'package:whats_app_clone/features/user/domain/entities/contact_entity.dart';
import 'package:whats_app_clone/features/user/domain/repositories/user_repository.dart';

class GetDeviceNumberUseCase {
  final UserRepository userRepository;

  GetDeviceNumberUseCase({
    required this.userRepository,
  });
  Future<List<ContactEntity>> call() async {
    return userRepository.getDeviceNumber();
  }
}
