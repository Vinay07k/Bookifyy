import 'package:bookify/Screens/EditScreen.dart';
import 'package:bookify/Widgets/buttons.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static final routeName = '/profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CustomElevatedButton(
            child: Text('Edit'),
            onPressedFunction: () =>
                Navigator.of(context).pushNamed(EditScreen.routeName),
          ),
        ),
      ),
    );
  }
}
