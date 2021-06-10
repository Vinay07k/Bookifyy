import 'package:bookify/Widgets/contactItem.dart';
import 'package:bookify/Widgets/inputfield.dart';
import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

class InviteContactsScreen extends StatefulWidget {
  static final routeName = 'invite-contact';
  const InviteContactsScreen({Key? key}) : super(key: key);

  @override
  _InviteContactsScreenState createState() => _InviteContactsScreenState();
}

class _InviteContactsScreenState extends State<InviteContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Invite',
            style: KTextStyles.kAppBarTitle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10,
          ),
          child: Column(
            children: [
              inputtextField('Search your contacts...', TextInputType.name),
              SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) =>
                      ContactItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
