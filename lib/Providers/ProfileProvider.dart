import 'dart:io';

import 'package:bookify/Models/Blurbuser.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseCloud = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  String get userId => _firebaseAuth.currentUser!.uid;

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
    //
    ///Meta User Details to access data from Firestore
    // await _firebaseAuth.currentUser!.reload();

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

  ///To update User profile details
  Future<void> updateProfile({
    required Map<String, String?> updatedProfileDetails,
    File? imageFile,
  }) async {
    //
    try {
      if (imageFile != null) {
        Reference reference =
            _firebaseStorage.ref('profile_pictures/$userId.png');
        await reference.putFile(imageFile);
        String _avatarImageUrl = await reference.getDownloadURL();
        //
        updatedProfileDetails = {
          'profilePicUrl': _avatarImageUrl,
          ...updatedProfileDetails
        };
      }

      await _firebaseCloud
          .collection('users')
          .doc(userId)
          .update(updatedProfileDetails);
    } on Exception catch (e) {
      print(e);
      throw 'Something went wrong! Please try again later.';
    }
  }
}
