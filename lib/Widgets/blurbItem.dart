import 'package:bookify/Screens/PostScreen.dart';
import 'package:flutter/material.dart';

class BlurbItem extends StatelessWidget {
  const BlurbItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(23, 23, 23, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10, right: 14),
            leading: CircleAvatar(
              radius: 24,
              foregroundImage: AssetImage('assets/download.jpeg'),
            ),
            title: Text(
              'Madara Uchiha',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
              ),
            ),
            subtitle: Text(
              '@theonlyone',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              '11m ago',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
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
                      icon: Icon(Icons.favorite),
                      label: Text('44'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      icon: Icon(Icons.comment_outlined),
                      label: Text('44'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share_outlined),
                      color: Colors.white,
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
