import 'package:flutter/material.dart';

//Screen imports
import 'package:bookify/Screens/EditScreen.dart';

//Widgets imports
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/description_box.dart';

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
        body: Column(
          children: [
            // * : For Top Background Image, Profile Avatar and Edit Screen Button
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Image.asset('assets/bg.png'),
                ),
                Positioned(
                  left: 20,
                  bottom: 10,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/download.jpeg'),
                    radius: 40,
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: -3,
                  child: CustomElevatedButton(
                    onPressedFunction: () =>
                        Navigator.of(context).pushNamed(EditScreen.routeName),
                    child: Text(
                      'Edit Screen',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    size: Size(80, 35),
                  ),
                ),
                IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    color: Theme.of(context).accentColor,
                    size: 26,
                  ),
                ),
              ],
            ),
            const DescriptionBox(),
            Expanded(
              child: Center(
                child: Text(
                  'No Posts yet',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    // fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).focusColor,
          onPressed: () {},
          child: Icon(Icons.open_in_new),
        ),
      ),
    );
  }
}
