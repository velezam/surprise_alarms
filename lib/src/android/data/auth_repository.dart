import '../models/app_user_model.dart';

abstract class AuthRepository {
  Stream<AppUser?> authStateChanges();

  Future<AppUser> signInAnonymously();

  Future<void> signOut();
}
