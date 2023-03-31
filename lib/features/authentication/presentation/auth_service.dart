import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _instance = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _instance.authStateChanges();
  // final authenticatedUser = FirebaseAuth.instance.currentUser;
  String? get userId => _instance.currentUser!.uid;

  Future<UserCredential> registerUser({
    required String email,
    required String password,
  }) async {
    return await _instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> emailLogin({
    required String email,
    required String password,
  }) async {
    return await _instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _instance.signOut();
  }
}
