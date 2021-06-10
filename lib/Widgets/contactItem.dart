import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        leading: CircleAvatar(
          radius: 26,
          foregroundImage: AssetImage('assets/download.jpeg'),
        ),
        title: Text(
          'Aye Sanam',
          style: KTextStyles.kNameText,
        ),
        trailing: OutlinedButton(
          onPressed: () {},
          child: Text('Invite'),
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(color: Theme.of(context).accentColor),
            ),
            foregroundColor:
                MaterialStateProperty.all(Theme.of(context).accentColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
