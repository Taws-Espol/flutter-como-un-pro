import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthenticationProvider();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;

      if (user != null) {
        print("[LOG] Inicio se sesión exitoso: ${user.email}");
        if (!user.emailVerified) user.sendEmailVerification();
      } else {
        print("[LOG] Error en el inicio de sesión");
      }
    } catch (error) {
      print("[LOG] Error en el inicio de sesión: $error");
    }

    notifyListeners();
  }

  Future<void> signOut() async {
    notifyListeners();
  }
}
