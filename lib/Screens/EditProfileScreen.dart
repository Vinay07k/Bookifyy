import 'dart:io';

import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Screens/ScreenController.dart';
import 'package:bookify/Widgets/Scaffold/bottom_snackbar.dart';
import 'package:bookify/Widgets/inputfield.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:flutter/material.dart';

import 'package:bookify/Widgets/buttons.dart';

import 'package:bookify/Providers/ProfileProvider.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class EditScreen extends StatefulWidget {
  static final routeName = '/edit-screen';

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late BlurbUser user;
  bool _loading = false;
  File? _imageFile;

  late TextEditingController _fullname;
  late TextEditingController _username;
  late TextEditingController _bio;
  late TextEditingController _instahandle;

  @override
  void initState() {
    super.initState();

    //
    _fullname = TextEditingController();
    _username = TextEditingController();
    _bio = TextEditingController();
    _instahandle = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //
    final Map<String, BlurbUser> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, BlurbUser>;

    user = data['user']!;
    //
    _fullname.text = user.fullname;
    _username.text = user.username;
    _bio.text = user.bio ?? '';
    _instahandle.text = user.instahandle ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _loading
          ? Loading()
          : Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Edit Profile',
                  style:
                      KTextStyles.kAppBarTitle(Theme.of(context).accentColor),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomElevatedButton(
                      onPressedFunction: onSubmit,
                      child: Text(
                        'Save',
                        style: KTextStyles.kButtonText,
                      ),
                      size: Size(60, 20),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 40),
                          child: Image.asset('assets/bg.png'),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 0,
                          child: CircleAvatar(
                            backgroundImage: _imageFile != null
                                ? FileImage(_imageFile!)
                                : ((user.profilePicUrl != null)
                                    ? NetworkImage(user.profilePicUrl!)
                                    : AssetImage(
                                            'assets/avatar_placeholder.jpg')
                                        as ImageProvider),
                            child: IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.camera),
                              onPressed: avatarImagePicker,
                            ),
                            radius: 40,
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          inputtextField(
                            label: 'Username',
                            keyboard: TextInputType.name,
                            controller: _username,
                            disable: true,
                          ),
                          const SizedBox(height: 16),
                          inputtextField(
                            label: 'Full Name',
                            keyboard: TextInputType.name,
                            controller: _fullname,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 16),
                          inputtextField(
                            label: 'Bio',
                            keyboard: TextInputType.multiline,
                            lines: 4,
                            controller: _bio,
                            textInputAction: TextInputAction.newline,
                          ),
                          const SizedBox(height: 16),
                          inputtextField(
                            label: 'Insta',
                            keyboard: TextInputType.url,
                            controller: _instahandle,
                            textInputAction: TextInputAction.done,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void onSubmit() async {
    final String fullname = _fullname.text.trim();
    final String bio = _bio.text.trim();
    final String instahandle = _instahandle.text.trim();
    // late String result;

    if (fullname.length < 4) {
      showBottomSnackBar(
          context: context,
          text: 'Full Name can not be less then 4 characters!');
      return;
    }

    setState(() {
      _loading = true;
    });
    //
    try {
      await ProfileProvider().updateProfile(
        updatedProfileDetails: {
          'fullname': fullname,
          'bio': bio,
          'instahandle': instahandle,
        },
        imageFile: _imageFile,
      );
    } catch (e) {
      print(e);
    }

    Navigator.of(context).pushReplacementNamed(ScreenController.routeName);
  }

  void avatarImagePicker() async {
    var file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 1000,
      maxWidth: 1000,
    );

    setState(() {
      _imageFile = File(file!.path);
    });
  }
}
