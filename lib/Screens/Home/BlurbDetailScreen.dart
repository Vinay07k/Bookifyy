import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:bookify/constants.dart';

import 'package:bookify/Widgets/Post/postScreenBlurb.dart';
import 'package:bookify/Widgets/Post/commentItem.dart';

class BlurbScreen extends StatefulWidget {
  final routeName = '/post-screen';
  const BlurbScreen({Key? key}) : super(key: key);

  @override
  _BlurbScreenState createState() => _BlurbScreenState();
}

class _BlurbScreenState extends State<BlurbScreen> {
  bool _shouldBeVisible = true;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _shouldBeVisible = _scrollController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Blurb',
            style: KTextStyles.kAppBarTitle(Theme.of(context).accentColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PostScreenBlurb(),
              Divider(color: Theme.of(context).accentColor),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => CommentItem(),
              ),
            ],
          ),
        ),
        floatingActionButton: _shouldBeVisible
            ? FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add_comment_outlined),
                backgroundColor: Theme.of(context).focusColor,
              )
            : null,
      ),
    );
  }
}
