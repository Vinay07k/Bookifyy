import 'package:bookify/Models/Blurbuser.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseCloud = FirebaseFirestore.instance;

  BlurbUser mapToBlurbUser(Map mappedUserData) {
    return BlurbUser(
      id: mappedUserData['uid'],
      fullname: mappedUserData['fullname'],
      username: mappedUserData['username'],
      bio: mappedUserData['bio'],
      dateJoined: mappedUserData['dateJoined'],
      profilePicUrl: mappedUserData['profilePicUrl'],
      followers: mappedUserData['followers'],
      followings: mappedUserData['followings'],
      instahandle: mappedUserData['instahandle'],
    );
  }

  ///Returns Current Logged in UserBlurb object
  Future<BlurbUser> get getCurrentUser async {
    ///Meta User Details to access data from Firestore
    await _firebaseAuth.currentUser!.reload();
    final String userId = _firebaseAuth.currentUser!.uid;
    final DateTime? dateJoined =
        _firebaseAuth.currentUser!.metadata.creationTime;

    ///Get user info from CloudFirestore
    final DocumentSnapshot documentSnapshot =
        await _firebaseCloud.collection('users').doc(userId).get();

    final Map<String, dynamic> userCredential =
        documentSnapshot.data() as Map<String, dynamic>;
    // print(userCredential);
    return mapToBlurbUser({
      'uid': userId,
      'dateJoined': dateJoined!,
      ...userCredential,
    });
  }
}
