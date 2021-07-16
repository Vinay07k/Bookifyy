import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';
import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

class CreateBlurbScreen extends StatelessWidget {
  static final routeName = '/create-blurb';
  const CreateBlurbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Create Blurb',
            style: KTextStyles.kAppBarTitle(
              Theme.of(context).accentColor,
              28,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              child: CustomElevatedButton(
                onPressedFunction: () {},
                child: Text(
                  'Post',
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
              const SizedBox(height: 1),
              inputtextField(
                label: 'Share what you read today . . .',
                lines: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '10 / 300',
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
}
