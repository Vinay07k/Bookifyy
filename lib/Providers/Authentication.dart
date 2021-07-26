import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseCloud = FirebaseFirestore.instance;

  get signOut => _firebaseAuth.signOut();

  Future<String?> singUpUser({
    required String email,
    required String password,
    required String fullname,
    required String username,
    // required String bio,
    // required String instahandle,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final String userId = userCredential.user!.uid;
      await _firebaseCloud.collection('users').doc(userId).set({
        'fullname': fullname,
        'username': username,
        'bio': '',
        'instahandle': '',
        'followers': [],
        'following': [],
        'profilePicUrls': '',
      });
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

  Future<String?> signInUser(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

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
