import 'package:bookify/Providers/BlurbProvider.dart';
import 'package:bookify/Widgets/Scaffold/bottom_snackbar.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:flutter/material.dart';

//
import 'package:bookify/Screens/ScreenController.dart';

//
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';

//
import 'package:bookify/constants.dart';
import 'package:provider/provider.dart';

class CreateBlurbScreen extends StatefulWidget {
  static final routeName = '/create-blurb';

  @override
  _CreateBlurbScreenState createState() => _CreateBlurbScreenState();
}

class _CreateBlurbScreenState extends State<CreateBlurbScreen> {
  late TextEditingController _contentController;
  int _contentLength = 0;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController();
    textInputCheck();
  }

  @override
  void dispose() {
    super.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _loading
          ? Loading()
          : Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                    child: CustomElevatedButton(
                      onPressedFunction: onSubmit,
                      child: Text(
                        'Blurb',
                        style: KTextStyles.kButtonText,
                      ),
                      size: const Size(80, 30),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    inputtextField(
                      controller: _contentController,
                      label: 'Share what you read today . . .',
                      lines: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 4,
                      ),
                      child: Text(
                        '$_contentLength / 300',
                        style: KTextStyles.kAppBarTitle(
                          Theme.of(context).focusColor,
                          14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void textInputCheck() {
    _contentController.addListener(() {
      setState(() {
        _contentLength = _contentController.text.trim().length;
      });
    });
  }

  void onSubmit() async {
    setState(() {
      _loading = true;
    });
    final String content = _contentController.text.trim();

    if (_contentLength > 300) {
      setState(() {
        _loading = false;
      });
      showBottomSnackBar(
        context: context,
        text: 'Content can not be more than 300 charachters!',
      );
      return;
    }
    await Provider.of<BlurbProvider>(context, listen: false)
        .createBlurb(content);

    Navigator.of(context).pop();
  }
}
