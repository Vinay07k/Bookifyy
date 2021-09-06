import 'package:bookify/Models/BlurbModal.dart';
import 'package:bookify/Providers/BlurbProvider.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:flutter/material.dart';

import 'package:bookify/Widgets/Post/blurbItem.dart';
import 'package:provider/provider.dart';

class BlurbsScreen extends StatefulWidget {
  const BlurbsScreen({Key? key}) : super(key: key);

  @override
  _BlurbsScreenState createState() => _BlurbsScreenState();
}

class _BlurbsScreenState extends State<BlurbsScreen> {
  late List<BlurbItemModal> _blurbs;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Theme.of(context).primaryColor,
      color: Theme.of(context).focusColor,
      onRefresh: () {
        setState(() {});
        return Future.delayed(Duration(seconds: 0));
      },
      child: Consumer<BlurbProvider>(
        builder: (context, blurbProvider, child) => FutureBuilder(
          future: blurbProvider.getBlurbs,
          builder: (context, AsyncSnapshot<List<BlurbItemModal>> snapshot) {
            // print(snapshot.data);
            if (snapshot.connectionState != ConnectionState.done)
              return Loading();
            _blurbs = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                itemCount: _blurbs.length,
                itemBuilder: (context, index) => BlurbItem(_blurbs[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
