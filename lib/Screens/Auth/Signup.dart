import 'package:bookify/Providers/Authentication.dart';
import 'package:bookify/Screens/ScreenController.dart';
import 'package:bookify/Widgets/Scaffold/bottom_snackbar.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Helper Imports
import 'package:bookify/constants.dart';
import 'package:bookify/sizeconfig.dart';

//Widgets Imports
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';

//Screens Imports
import 'package:bookify/Screens/Auth/Login.dart';

class SignUpScreen extends StatefulWidget {
  static final String routeName = '/signup';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _loading = false;

  late TextEditingController _email;
  late TextEditingController _fullname;
  late TextEditingController _password;
  late TextEditingController _confirmpassword;

  // late String fullname;
  // late String username;
  // late String bio;
  // late String instahandle;

  @override
  void initState() {
    super.initState();

    _fullname = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmpassword = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // * : To get about data from arguments
    // final Map<String, String> arguments =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // getAbout(arguments);
  }

  // void getAbout(Map<String, Object> arguments) {
  //   // print(arguments);
  //   fullname = arguments['fullname'].toString();
  //   username = arguments['username'].toString();
  //   bio = arguments['bio'].toString();
  //   instahandle = arguments['instahandle'].toString();
  // }

  void onSubmit() async {
    String fullname = _fullname.text.trim();
    final String email = _email.text;
    final String password = _password.text;
    final String confirmPassword = _confirmpassword.text;
    late String result;

    if (fullname.length < 4) {
      result = 'Full Name can not be less then 4 characters!';
    }
    //For email validation
    else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email) ||
        email.isEmpty) {
      result = 'Invalid Email';
      //
      //Passwords Validation
      //
    } else if (password.isEmpty ||
        password.length < 8 ||
        password.contains(' ')) {
      //
      result =
          'Password should be greater then 8 characters and should not have spaces!';
      //
    } else if (password != confirmPassword) {
      result = 'Passwords does not match!';
    } else {
      setState(() {
        _loading = true;
      });

      final String username = email.split('@')[0];

      result = await Auth().singUpUser(
            fullname: fullname,
            username: '@$username',
            email: email,
            password: password,
          ) ??
          '';
      Navigator.of(context).pushReplacementNamed(ScreenController.routeName);
      // setState(() {
      //   _loading = false;
      // });
    }

    if (result.isNotEmpty) {
      setState(() {
        _loading = false;
      });
      showBottomSnackBar(context: context, text: '$result');
    }
  }

  @override
  void dispose() {
    super.dispose();

    _fullname.dispose();
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _loading
          ? Loading()
          : GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Create Account',
                        style: KTextStyles.kScreenTitle,
                      ),
                      SizedBox(height: getRelativeHeight(0.03)),
                      inputtextField(
                        label: 'Full Name',
                        keyboard: TextInputType.name,
                        controller: _fullname,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: getRelativeHeight(0.025)),
                      inputtextField(
                        label: 'Email',
                        controller: _email,
                        keyboard: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: getRelativeHeight(0.025)),
                      inputtextField(
                        label: 'Password',
                        controller: _password,
                        keyboard: TextInputType.visiblePassword,
                        hiddenText: true,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: getRelativeHeight(0.025)),
                      inputtextField(
                        label: 'Confirm Password',
                        controller: _confirmpassword,
                        keyboard: TextInputType.visiblePassword,
                        hiddenText: true,
                        textInputAction: TextInputAction.done,
                      ),
                      // Spacer(),
                      SizedBox(height: getRelativeHeight(0.32)),
                      CustomElevatedButton(
                          child: Text(
                            'Create Account',
                            style: KTextStyles.kButtonText,
                          ),
                          onPressedFunction: () => onSubmit()
                          // Navigator.of(context).pushNamed(InputDetail.routeName),
                          ),
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
}
