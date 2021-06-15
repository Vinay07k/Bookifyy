import 'package:flutter/material.dart';

import 'package:bookify/constants.dart';

import 'package:bookify/Widgets/Books/gridItem.dart';
import 'package:bookify/Widgets/Books/tabButtons.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 8),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            title: Text(
              'Hi Akshay!',
              style: KTextStyles.kScreenTitle,
            ),
            subtitle: Text(
              'You seem pumped. Let’s get started!',
              style: KTextStyles.kSubTitle,
            ),
          ),
          Divider(
            color: Theme.of(context).accentColor,
            thickness: 4,
            endIndent: 220,
          ),
          Container(
            clipBehavior: Clip.none,
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) =>
                  TabButton('Color', index % 2 == 0 ? true : false),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 6,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (BuildContext context, int index) => GridItem(),
            ),
          ),
        ],
      ),
    );
  }
}
