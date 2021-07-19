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
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              child: CustomElevatedButton(
                onPressedFunction: () {},
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
                label: 'Share what you read today . . .',
                lines: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 300),
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
