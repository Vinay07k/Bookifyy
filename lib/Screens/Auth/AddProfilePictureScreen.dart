import 'package:bookify/Screens/ScreenController.dart';
import 'package:bookify/Widgets/add_profile_pic_avatat.dart';
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/constants.dart';
import 'package:bookify/sizeconfig.dart';
import 'package:flutter/material.dart';

class AddProfilePictureScreen extends StatelessWidget {
  static final routeName = '/add-profile-picture';
  const AddProfilePictureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              Text(
                'Bookify',
                style: KTextStyles.kAppBarTitle(
                  Theme.of(context).accentColor,
                  42,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Pick a profile picture',
                style: KTextStyles.kAppBarTitle(
                  Theme.of(context).accentColor,
                  20,
                ),
              ),
              SizedBox(
                height: getRelativeHeight(0.12),
              ),
              const AddProfilePicAvatar(),
              Spacer(),
              CustomElevatedButton(
                onPressedFunction: () => Navigator.of(context)
                    .pushReplacementNamed(ScreenController.routeName),
                child: Text(
                  'Next',
                  style: KTextStyles.kButtonText,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(ScreenController.routeName),
                child: Text(
                  'Skip for now',
                  style: TextStyle(
                    color: Theme.of(context).focusColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
