import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.only(left: 10, right: 12),
            leading: CircleAvatar(
              radius: 20,
              foregroundImage: AssetImage('assets/download.jpeg'),
            ),
            title: Text(
              'Madara Uchiha',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
              ),
            ),
            subtitle: const Text(
              'Replying to @theonlyone',
              style: TextStyle(
                fontSize: 10,
                color: Colors.yellow,
              ),
            ),
            trailing: Text(
              '11m ago',
              style: KTextStyles.kCreatedTimeText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi posue fames pulvinar posuere. Eget vel sed ultrices mauris vestibulum, fringilla diam a. Ornare facilisis id turpis aliquam. Neque senectus sed vitae vestibulum et massa enim tempor.',
              style: KTextStyles.kDescriptionText,
            ),
          ),
        ],
      ),
    );
  }
}