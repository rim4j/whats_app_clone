import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:whats_app_clone/features/user/user_locator.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  //external
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  locator.registerLazySingleton(() => auth);
  locator.registerLazySingleton(() => fireStore);

  await userLocator();
}
