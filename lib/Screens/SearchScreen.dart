import 'package:bookify/Widgets/inputfield.dart';
import 'package:flutter/material.dart';

import 'package:bookify/constants.dart';

class SearchScreen extends StatefulWidget {
  static final routeName = '/search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Search',
            style: KTextStyles.kAppBarTitle(
              Theme.of(context).accentColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 8),
              inputtextField(
                label: 'Search people to connect...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
