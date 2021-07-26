import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static get signOut => FirebaseAuth.instance.signOut();

  // get some => FirebaseAuth.instance.fetchSignInMethodsForEmail(email)

  static Future<String?> singUpUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //
    } on FirebaseAuthException catch (exeception) {
      //
      if (exeception.code == 'email-already-in-use') {
        return 'Email is already taken!';
      }

      if (exeception.code == 'invalid-email') {
        return 'Invalid Email!';
      }
      if (exeception.code == 'weak-password') {
        return 'Try something strong!. It\'s a password not a nickname';
      }

      return exeception.message;
    } catch (e) {
      print(e);
    }
  }

  static Future<String?> signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // print(user);
    } on FirebaseAuthException catch (exeception) {
      // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      // print(exeception.message);
      if (exeception.code == 'invalid-email') {
        return 'Invalid Email!';
      }

      if (exeception.code == 'user-not-found') {
        return 'Email does not belong to any user. Try Creating account!';
      }
      if (exeception.code == 'wrong-password') {
        return 'Wrong Password!';
      }
      if (exeception.code == 'user-disabled') {
        return 'User is banned!. Try contacting us for any solution';
      }
      return exeception.message;
    } catch (e) {
      print(e);
    }
  }
}
