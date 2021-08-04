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
    List data = _data.docs;

    return data.map((blurbData) => BlurbItemModal.fromMap(blurbData)).toList();
    // print(data[0].data());
  }

  // Future<List>
}
