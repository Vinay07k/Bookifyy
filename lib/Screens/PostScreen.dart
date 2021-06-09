import 'package:bookify/Widgets/commentItem.dart';
import 'package:flutter/material.dart';

import 'package:bookify/Widgets/blurbItem.dart';

class PostScreen extends StatefulWidget {
  final routeName = '/post-screen';
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlurbItem(),
            Divider(color: Colors.white),
            Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => CommentItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
