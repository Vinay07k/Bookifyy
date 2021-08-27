import 'package:bookify/Models/BlurbModal.dart';
import 'package:bookify/Providers/BlurbProvider.dart';
import 'package:bookify/Providers/ProfileProvider.dart';
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:bookify/constants.dart';

import 'package:bookify/Widgets/Post/postScreenBlurb.dart';
import 'package:bookify/Widgets/Post/commentItem.dart';
import 'package:provider/provider.dart';

class BlurbScreen extends StatefulWidget {
  final routeName = '/post-screen';
  const BlurbScreen({Key? key}) : super(key: key);

  @override
  _BlurbScreenState createState() => _BlurbScreenState();
}

class _BlurbScreenState extends State<BlurbScreen> {
  bool _shouldBeVisible = true;
  late ScrollController _scrollController;

  late final BlurbItemModal _blurb;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    //
    _scrollController.addListener(() {
      setState(() {
        _shouldBeVisible = _scrollController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _blurb = ModalRoute.of(context)!.settings.arguments as BlurbItemModal;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
              PostScreenBlurb(_blurb),
              Divider(color: Theme.of(context).accentColor),
              Consumer<BlurbProvider>(builder: (context, snapshot, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemCount: _blurb.commentCount ?? 0,
                  itemBuilder: (BuildContext context, int index) => CommentItem(
                    commentData:
                        _blurb.comments![index] as Map<String, dynamic>,
                  ),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: CommentSection(
          blurb: _blurb,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}

class CommentSection extends StatefulWidget {
  const CommentSection({Key? key, required this.blurb}) : super(key: key);

  final BlurbItemModal blurb;

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  late FocusNode _commentFocusNode = FocusNode();
  late TextEditingController _commentController;
  int _wordCount = 0;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    //
    _commentFocusNode.addListener(() {
      setState(() {});
    });
    _commentController.addListener(() {
      setState(() {
        _wordCount = _commentController.text.trim().length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _commentFocusNode.hasFocus ? 103 : 50,
      padding: const EdgeInsets.only(left: 30),
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          inputtextField(
            controller: _commentController,
            label: 'Write your comment . . .',
            focusNode: _commentFocusNode,
          ),
          if (_commentFocusNode.hasFocus)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$_wordCount / 300',
                  style: KTextStyles.kButtonText.copyWith(
                    color: _wordCount > 300
                        ? Colors.redAccent
                        : Theme.of(context).focusColor,
                    fontSize: 16,
                  ),
                ),
                CustomElevatedButton(
                  onPressedFunction: () async {
                    _commentFocusNode.unfocus();
                    await Provider.of<BlurbProvider>(context, listen: false)
                        .writeComment(
                      blurb: widget.blurb,
                      text: _commentController.text.trim(),
                    );
                    setState(() {});
                  },
                  child: Text(
                    'Comment',
                    style: KTextStyles.kButtonText.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  size: Size(80, 35),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
