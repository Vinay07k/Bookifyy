import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

import 'package:bookify/Screens/Home/BlurbDetailScreen.dart';

class BlurbItem extends StatelessWidget {
  const BlurbItem(this.index, {Key? key}) : super(key: key);

  final int index;
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
            contentPadding: const EdgeInsets.only(left: 10, right: 14),
            leading: CircleAvatar(
              radius: 24,
              foregroundImage: AssetImage('assets/download.jpeg'),
            ),
            title: Text(
              'Madara Uchiha',
              style: KTextStyles.kNameText,
            ),
            subtitle: const Text(
              '@theonlyone',
              style: const TextStyle(color: Colors.white),
            ),
            trailing: Text(
              '11m ago',
              style: KTextStyles.kCreatedTimeText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 60,
              right: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(PostScreen().routeName),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi posue fames pulvinar posuere. Eget vel sed ultrices mauris vestibulum, fringilla diam a. Ornare facilisis id turpis aliquam. Neque senectus sed vitae vestibulum et massa enim tempor.',
                    style: KTextStyles.kDescriptionText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).focusColor),
                      ),
                      icon: const Icon(Icons.favorite),
                      label: Text('44'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).accentColor),
                      ),
                      icon: const Icon(Icons.comment_outlined),
                      label: Text('44'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                      color: Theme.of(context).accentColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
