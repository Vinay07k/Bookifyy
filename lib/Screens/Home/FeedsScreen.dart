import 'package:flutter/material.dart';

import 'package:bookify/Widgets/blurbItem.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => BlurbItem(index),
      ),
    );
  }
}
