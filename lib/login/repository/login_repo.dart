import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  final _auth = FirebaseAuth.instance;
  Future<bool> loginSt(String email, String password) async {
    try {
      final user_Credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      //print('----------------------------------------------------------------');
      // print(e.code);
      rethrow;
    }
  }
}
