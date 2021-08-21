import 'package:bookify/Screens/Auth/Login.dart';
import 'package:bookify/Screens/Auth/Signup.dart';
import 'package:bookify/Widgets/Scaffold/bottom_snackbar.dart';
import 'package:flutter/material.dart';

//Helper Imports
import 'package:bookify/constants.dart';
import 'package:bookify/sizeconfig.dart';

//Widgets Imports
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';

class InputDetail extends StatefulWidget {
  static final routeName = '/input-detail';

  @override
  _InputDetailState createState() => _InputDetailState();
}

class _InputDetailState extends State<InputDetail> {
  late TextEditingController _fullname;
  late TextEditingController _username;
  late TextEditingController _bio;
  late TextEditingController _instahandle;

  @override
  void initState() {
    super.initState();
    _fullname = TextEditingController();
    _username = TextEditingController();
    _bio = TextEditingController();
    _instahandle = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _fullname.dispose();
    _username.dispose();
    _bio.dispose();
    _instahandle.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'About',
                  style: KTextStyles.kScreenTitle,
                ),
                SizedBox(height: getRelativeHeight(0.03)),
                inputtextField(
                  label: 'Full Name',
                  keyboard: TextInputType.name,
                  controller: _fullname,
                ),
                SizedBox(height: getRelativeHeight(0.025)),
                inputtextField(
                  label: 'Username',
                  keyboard: TextInputType.text,
                  controller: _username,
                ),
                SizedBox(height: getRelativeHeight(0.025)),
                inputtextField(
                  label: 'Bio (Optional)',
                  keyboard: TextInputType.multiline,
                  controller: _bio,
                  lines: 10,
                ),
                SizedBox(height: getRelativeHeight(0.025)),
                inputtextField(
                  label: 'Insta Handle (Optional)',
                  keyboard: TextInputType.url,
                  controller: _instahandle,
                ),
                const SizedBox(height: 20),
                // Spacer(),
                CustomElevatedButton(
                  onPressedFunction: onSubmit,
                  child: Text(
                    'Next >>',
                    style: KTextStyles.kButtonText,
                  ),
                ),
                // const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: KTextStyles.kSimpleText,
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(LoginScreen().routeName),
                      child: Text(
                        'Login!',
                        style: KTextStyles.kSimpleText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    String fullname = _fullname.text.trim();
    String username = _username.text.trim();
    String bio = _bio.text.trim();
    String instahandle = _instahandle.text.trim();

    String result = '';

    if (fullname.isEmpty || username.isEmpty) {
      result = 'Full Name and Username can not be empty!';
    } else if (fullname.length < 4) {
      result = 'Full Name can not be less then 4 characters!';
    } else if (username.length < 4) {
      result = 'Username can not be less then 4 characters!';
    } else {
      Navigator.of(context).pushNamed(SignUpScreen.routeName, arguments: {
        'fullname': fullname,
        'username': username,
        'bio': bio,
        'instahandle': instahandle,
      });
    }

    if (result.isNotEmpty) {
      showBottomSnackBar(context: context, text: result);
    }
  }
}
