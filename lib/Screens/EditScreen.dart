import 'package:bookify/Widgets/inputfield.dart';
import 'package:flutter/material.dart';

import 'package:bookify/Widgets/buttons.dart';

import '../constants.dart';

class EditScreen extends StatefulWidget {
  static final routeName = '/edit-screen';
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: KTextStyles.kAppBarTitle,
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
                onPressedFunction: () {},
                child: Text(
                  'Save',
                  // style: KTextStyles.kButtonText,
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
                      child: Image.asset('assets/bg.png')),
                  Positioned(
                    left: 20,
                    bottom: 0,
                    child: CircleAvatar(
                      child: Icon(
                        Icons.camera,
                        color: Colors.white54,
                        size: 40,
                      ),
                      backgroundImage: AssetImage('assets/download.jpeg'),
                      radius: 40,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    inputtextField('Name', TextInputType.name),
                    const SizedBox(height: 16),
                    inputtextField('Username', TextInputType.name),
                    const SizedBox(height: 16),
                    inputtextField('Bio', TextInputType.text, lines: 4),
                    const SizedBox(height: 16),
                    inputtextField('Insta', TextInputType.url),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
