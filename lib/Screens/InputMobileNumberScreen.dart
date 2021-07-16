import 'package:bookify/Widgets/inputfield.dart';
import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

class InputMobileNumberScreen extends StatelessWidget {
  static final routeName = '/number-screen';
  const InputMobileNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your mobile number',
                style: KTextStyles.kAppBarTitle(
                  Theme.of(context).accentColor,
                  24,
                ),
              ),
              SizedBox(height: 20),
              inputtextField(
                keyboard: TextInputType.number,
                prefixtext: '+91',
              )
            ],
          ),
        ),
      ),
    );
  }
}
