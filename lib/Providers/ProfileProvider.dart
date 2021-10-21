import 'dart:io';

import 'package:bookify/Models/Blurbuser.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseCloud = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  CollectionReference get usersCollection => _firebaseCloud.collection('users');
  String get currentuserId => _firebaseAuth.currentUser!.uid;

  ///Returns Current Logged in UserBlurb object
  Future<BlurbUser> get getCurrentUser async {
    return await getUser(currentuserId);
  }

  Future<BlurbUser> getUser(String userId) async {
    final DocumentSnapshot documentSnapshot =
        await usersCollection.doc(userId).get();

    final Map<String, dynamic> userCredential =
        documentSnapshot.data() as Map<String, dynamic>;

    return BlurbUser.mapToBlurbUser({
      'uid': userId,
      ...userCredential,
    });
  }

  Future<List<BlurbUser>> getUsers(List<String> userIds) async {
    QuerySnapshot response = await usersCollection
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
    required Map<String, dynamic> updatedProfileDetails,
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

      await usersCollection.doc(currentuserId).update(updatedProfileDetails);
    } on Exception catch (e) {
      print(e);
      throw 'Something went wrong! Please try again later.';
    }
  }

  Future<void> followUser(BlurbUser user) async {
    BlurbUser userDetails = await getUser(user.id);

    if (userDetails.followers == null) {
      await usersCollection.doc(user.id).update({
        'followers': [this.currentuserId]
      });
      // * : Updating local data to reflect in the app in realtime
      user.followers = [this.currentuserId];
    } else {
      user.followers!.add(this.currentuserId);
      await usersCollection.doc(user.id).update({'followers': user.followers});
    }
    BlurbUser currentUserDetails = await getUser(currentuserId);

    if (currentUserDetails.followings == null) {
      await usersCollection.doc(currentuserId).update({
        'followings': [user.id],
      });
    } else {
      currentUserDetails.followings!.add(user.id);
      await usersCollection
          .doc(currentuserId)
          .update({'followings': currentUserDetails.followings});
    }
  }

  Future<void> unFollowUser(BlurbUser user) async {
    BlurbUser userDetails = await getUser(user.id);
    if (userDetails.followers!.contains(currentuserId)) {
      user.followers = userDetails.followers;
      user.followers!.remove(currentuserId);
      await usersCollection.doc(user.id).update({'followers': user.followers});
    }
    BlurbUser currentUserDetails = await getUser(currentuserId);
    if (currentUserDetails.followings!.contains(user.id)) {
      currentUserDetails.followings!.remove(user.id);
      await usersCollection
          .doc(currentuserId)
          .update({'followings': currentUserDetails.followings});
    }
  }

  Future<List<BlurbUser>> searchUsers(String reference) async {
    QuerySnapshot usersSnapshot = await usersCollection.get();

    List<BlurbUser> users = usersSnapshot.docs
        .map((e) => BlurbUser.mapToBlurbUser({'uid': e.id, ...e.data() as Map}))
        .toList();

    List<BlurbUser> result = users
        .where((user) =>
            user.username.toLowerCase().contains(reference.toLowerCase()) ||
            user.fullname.toLowerCase().contains(reference.toLowerCase()))
        .toList();
    // print(result);
    return result;
  }
}
