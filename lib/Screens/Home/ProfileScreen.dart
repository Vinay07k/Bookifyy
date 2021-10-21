import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookify/Providers/BlurbProvider.dart';
import 'package:bookify/Providers/ProfileProvider.dart';

//Modal Imports
import 'package:bookify/Models/BlurbModal.dart';
import 'package:bookify/Models/Blurbuser.dart';

//Screen imports
import 'package:bookify/Screens/EditProfileScreen.dart';

//Widgets imports
import 'package:bookify/Widgets/Post/blurbItem.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/description_box.dart';
import 'package:bookify/Widgets/profile_info_dialog.dart';

class ProfileScreen extends StatefulWidget {
  static final routeName = '/profile-screen';
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final BlurbUser user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, BlurbUser> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, BlurbUser>;
    user = data['user']!;
    print('>>>>>>>>>>' + user.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Profile',
            style: KTextStyles.kAppBarTitle(Colors.white)
                .copyWith(letterSpacing: 0.5),
          ),
          centerTitle: true,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              DescriptionBox(
                profilePicUrl: user.profilePicUrl,
                fullname: user.fullname,
                bio: user.bio,
                dateJoined: user.dateJoined,
                username: user.username,
                instahandle: user.instahandle,
                followers: user.followers,
                following: user.followings,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomElevatedButton(
                  onPressedFunction: ProfileProvider().currentuserId == user.id
                      ? () => Navigator.of(context).pushNamed(
                          EditScreen.routeName,
                          arguments: {'user': user})
                      : user.followers == null ||
                              !user.followers!
                                  .contains(ProfileProvider().currentuserId)
                          //To Follow
                          ? () async {
                              await ProfileProvider().followUser(user);
                              setState(() {});
                            }
                          //To Unfollow
                          : () async {
                              await ProfileProvider().unFollowUser(user);
                              setState(() {});
                            },
                  child: Text(
                    ProfileProvider().currentuserId == user.id
                        ? 'Edit Profile'
                        : user.followers == null ||
                                !user.followers!
                                    .contains(ProfileProvider().currentuserId)
                            ? 'Follow'
                            : 'Unfollow',
                    style: KTextStyles.kButtonText.copyWith(letterSpacing: 0.7),
                  ),
                ),
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
      ),
    );
  }
}
