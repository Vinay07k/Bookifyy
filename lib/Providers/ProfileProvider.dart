import 'dart:io';

import 'package:bookify/Models/Blurbuser.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseCloud = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  String get currentuserId => _firebaseAuth.currentUser!.uid;

  ///Returns Current Logged in UserBlurb object
  Future<BlurbUser> get getCurrentUser async {
    return await getUser(currentuserId);
  }

  Future<BlurbUser> getUser(String userId) async {
    final DocumentSnapshot documentSnapshot =
        await _firebaseCloud.collection('users').doc(userId).get();

    final Map<String, dynamic> userCredential =
        documentSnapshot.data() as Map<String, dynamic>;

    return BlurbUser.mapToBlurbUser({
      'uid': userId,
      ...userCredential,
    });
  }

  Future<List<BlurbUser>> getUsers(List<String> userIds) async {
    QuerySnapshot response = await _firebaseCloud
        .collection('users')
        .where(FieldPath.documentId, whereIn: userIds)
        .get();
    // print(response.docs[0].data());
    return response.docs
        .map(
          (userData) => BlurbUser.mapToBlurbUser(
            {'uid': '', ...userData.data() as Map<dynamic, dynamic>},
          ),
        )
        .toList();
  }

  Future<void> updateProfile({
    required Map<String, String?> updatedProfileDetails,
    File? imageFile,
  }) async {
    //
    try {
      if (imageFile != null) {
        Reference reference =
            _firebaseStorage.ref('profile_pictures/$currentuserId.png');
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
          .doc(currentuserId)
          .update(updatedProfileDetails);
    } on Exception catch (e) {
      print(e);
      throw 'Something went wrong! Please try again later.';
    }
  }

  Future<void> followUser(BlurbUser user) async {
    BlurbUser userDetails = await getUser(user.id);

    if (userDetails.followers == null) {
      await _firebaseCloud.collection('users').doc(user.id).update({
        'followers': [this.currentuserId]
      });
      user.followers = [this.currentuserId];
    } else {
      user.followers!.add(this.currentuserId);
      await _firebaseCloud.collection('users').doc(user.id).update({
        'followers': [user.followers]
      });
    }
    //To update user id in active user's following list
    // DocumentSnapshot currentUser =
    //     await _firebaseCloud.collection('users').doc(currentuserId).get();
    // BlurbUser currentUserDetails =
    //     BlurbUser.mapToBlurbUser(currentUser.data() as Map);
    BlurbUser currentUserDetails = await getUser(currentuserId);

    if (currentUserDetails.followings == null) {
      await _firebaseCloud.collection('users').doc(currentuserId).update({
        'followings': [user.id],
      });
    } else {
      currentUserDetails.followings!.add(user.id);
      await _firebaseCloud
          .collection('users')
          .doc(currentuserId)
          .update({'followings': currentUserDetails.followings});
    }
  }

  Future<void> unfollowUser(String userId) async {}
}
