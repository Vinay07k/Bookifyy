import 'package:bookify/Widgets/postScreenBlurb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:bookify/Widgets/commentItem.dart';

class PostScreen extends StatefulWidget {
  final routeName = '/post-screen';
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool _shouldBeVisible = true;
  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _shouldBeVisible = _scrollController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PostScreenBlurb(),
            Divider(color: Colors.white),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => CommentItem(),
              ),
            ),
          ],
        ),
        floatingActionButton: _shouldBeVisible
            ? FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add_comment_outlined),
                backgroundColor: Theme.of(context).focusColor,
              )
            : null,
      ),
    );
  }
}
