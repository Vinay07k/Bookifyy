import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton(
    this.title,
    this.isActive, {
    Key? key,
  }) : super(key: key);

  final bool isActive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        height: double.infinity,
        decoration: BoxDecoration(
          color: !isActive
              ? Color.fromRGBO(46, 45, 45, 1)
              : Theme.of(context).focusColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: isActive
                ? KTextStyles.kButtonText
                : TextStyle(color: Theme.of(context).accentColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
