import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Providers/ProfileProvider.dart';
import 'package:bookify/Widgets/inputfield.dart';
import 'package:bookify/Widgets/list_users_item.dart';
import 'package:flutter/material.dart';

import 'package:bookify/constants.dart';

class SearchScreen extends StatefulWidget {
  static final routeName = '/search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;
  List<BlurbUser>? users;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

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
          actions: [
            IconButton(
              onPressed: onSubmit,
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 8),
              inputtextField(
                  controller: _controller,
                  keyboard: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  label: 'Search people to connect...'),
              if (users != null)
                if (users!.isNotEmpty)
                  Expanded(
                    child: ListUsersItem(
                      users: users!,
                    ),
                  ),
              if (users != null && users!.isEmpty)
                Expanded(
                  child: Center(
                    child: Text(
                      'No user found',
                      style: KTextStyles.kButtonText.copyWith(
                        color: Theme.of(context).focusColor,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    String _searchValue = _controller.text.trim();
    if (_searchValue.isNotEmpty) {
      print(_searchValue);
      users = await ProfileProvider().searchUsers(_searchValue);
      setState(() {});
      return;
    }
    users = [];
  }
}
