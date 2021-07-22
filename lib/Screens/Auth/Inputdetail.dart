import 'package:flutter/material.dart';

//Helper Imports
import 'package:bookify/constants.dart';
import 'package:bookify/sizeconfig.dart';

//Screens Imports
import 'package:bookify/Screens/Auth/AddProfilePictureScreen.dart';
import 'package:bookify/Screens/Auth/Signup.dart';

//Widgets Imports
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';

class InputDetail extends StatelessWidget {
  static final routeName = '/input-detail';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  'Details',
                  style: KTextStyles.kScreenTitle,
                ),
                SizedBox(height: getRelativeHeight(0.035)),
                inputtextField(
                  label: 'Name',
                  keyboard: TextInputType.name,
                ),
                SizedBox(height: getRelativeHeight(0.025)),
                inputtextField(
                  label: 'Username',
                  keyboard: TextInputType.text,
                  hiddenText: true,
                ),
                SizedBox(height: getRelativeHeight(0.035)),
                inputtextField(
                  label: 'Bio (Optional)',
                  keyboard: TextInputType.multiline,
                  hiddenText: true,
                ),
                SizedBox(height: getRelativeHeight(0.035)),
                inputtextField(
                  label: 'Insta Handle (Optional)',
                  keyboard: TextInputType.url,
                  hiddenText: true,
                ),
                // SizedBox(height: getRelativeHeight(0.035)),
                Spacer(),
                CustomElevatedButton(
                  onPressedFunction: () {
                    Navigator.of(context)
                        .pushNamed(AddProfilePictureScreen.routeName);
                  },
                  child: Text(
                    'Create Account',
                    style: KTextStyles.kButtonText,
                  ),
                ),
                const SizedBox(height: 14),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Don\'t have an account?',
                //       style: KTextStyles.kSimpleText,
                //     ),
                //     TextButton(
                //       onPressed: () => Navigator.of(context)
                //           .pushReplacementNamed(SignUpScreen().routeName),
                //       child: Text(
                //         'Register!',
                //         style: KTextStyles.kSimpleText,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
