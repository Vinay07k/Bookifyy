import 'package:bookify/Models/BlurbModal.dart';
import 'package:bookify/Providers/BlurbProvider.dart';
import 'package:bookify/Widgets/Post/blurbItem.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:flutter/material.dart';

//Modal Imports
import 'package:bookify/Models/Blurbuser.dart';

//Screen imports
import 'package:bookify/Screens/EditProfileScreen.dart';

//Widgets imports
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/description_box.dart';
import 'package:bookify/Widgets/profile_info_dialog.dart';

class ProfileScreen extends StatefulWidget {
  static final routeName = '/profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late BlurbUser user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, BlurbUser> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, BlurbUser>;
    user = data['user']!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => showInfoBox(context),
              icon: Icon(
                Icons.info_outline,
              ),
              iconSize: 28,
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
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
                      foregroundImage: (user.profilePicUrl != null)
                          ? NetworkImage(user.profilePicUrl!)
                          : AssetImage('assets/avatar_placeholder.jpg')
                              as ImageProvider,
                      radius: 40,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: -3,
                    child: CustomElevatedButton(
                      onPressedFunction: () => Navigator.of(context).pushNamed(
                        EditScreen.routeName,
                        arguments: {
                          'user': user,
                        },
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      size: Size(80, 35),
                    ),
                  ),
                ],
              ),
              DescriptionBox(
                fullname: user.fullname,
                bio: user.bio,
                dateJoined: user.dateJoined,
                username: user.username,
                instahandle: user.instahandle,
                followers: user.followers,
                following: user.followings,
              ),
              //User posts
              FutureBuilder(
                future: BlurbProvider().getUserBlurbs(user.id),
                builder:
                    (context, AsyncSnapshot<List<BlurbItemModal>?> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return Loading();

                  List<BlurbItemModal>? _blurbs = snapshot.data!;

                  return _blurbs.isEmpty
                      ? Center(
                          child: Text(
                            'No Posts yet',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _blurbs.length,
                          itemBuilder: (context, index) =>
                              BlurbItem(_blurbs[index]),
                        );
                },
              )
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Theme.of(context).focusColor,
        //   onPressed: () => BlurbProvider().getUserBlurbs(user.id),
        //   child: Icon(Icons.open_in_new),
        // ),
      ),
    );
  }
}
