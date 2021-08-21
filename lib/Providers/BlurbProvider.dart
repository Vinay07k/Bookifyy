import 'package:bookify/Models/BlurbModal.dart';
import 'package:bookify/Providers/ProfileProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlurbProvider with ChangeNotifier {
  // final FirebaseFirestore _firebaseCloud = FirebaseFirestore.instance;
  final CollectionReference<Map<String, dynamic>> _blurbCollection =
      FirebaseFirestore.instance.collection('blurbs');

  Future<void> createBlurb(String content) async {
    final Map<String, dynamic> _blurb = {
      'userId': ProfileProvider().currentuserId,
      'createdAt': DateTime.now(),
      'content': content,
      'likes': null,
      'comments': null,
    };
    try {
      await _blurbCollection.doc().set(_blurb);
      // notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<List<BlurbItemModal>> get getBlurbs async {
    QuerySnapshot _data =
        await _blurbCollection.orderBy('createdAt', descending: true).get();
    List blurbs = _data.docs;

    // blurbs.forEach((element) {
    //   print(element.);
    // });
    return blurbs
        .map((blurbData) => BlurbItemModal.fromMap(blurbData))
        .toList();
    // print(data[0].data());
  }

  Future<List<BlurbItemModal>?> getUserBlurbs(String userId) async {
    QuerySnapshot data = await _blurbCollection
        .where('userId', isEqualTo: userId)
        // .orderBy('createdAt', descending: true)
        .get();

    List _blurbs = data.docs;
    return _blurbs
        .map((blurbData) => BlurbItemModal.fromMap(blurbData))
        .toList();
  }

  Future<void> toggleLike({
    required BlurbItemModal blurb,
    required String userId,
  }) async {
    DocumentReference _blurbref = _blurbCollection.doc(blurb.blurbId);
    DocumentSnapshot _blurb = await _blurbref.get();
    Map<String, dynamic> blurbData = _blurb.data() as Map<String, dynamic>;
    // final List = blurbData['likes'];
    final List? likes = blurbData['likes'];

    try {
      ///When there are no likes
      if (likes == null) {
        await _blurbref.update({
          'likes': [userId]
        });
        blurb.likes = [userId];
      } else {
        ///When the user has not liked this post
        if (!likes.contains(userId)) {
          likes.add(userId);
          await _blurbref.update({'likes': likes});
          blurb.likes = likes.cast<String>();

          ///When the user has already liked the post
        } else {
          likes.remove(userId);
          await _blurbref.update({'likes': likes});
          blurb.likes = likes.cast<String>();
        }
      }
      // notifyListeners();
    } catch (e) {
      print(e);
    }

    // print(_blurb['likes']);
  }
}
