import 'package:flutter/material.dart';

import 'package:bookify/constants.dart';

void showInfoBox(BuildContext context) => showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Theme.of(context).cardColor,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 24.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tips for you :',
                style: KTextStyles.kAppBarTitle(
                  Theme.of(context).accentColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '1. Blurbing is very easy. People who share atleast 5 learnings everyday from the book they read have a much higher chance of being noticed by other wonks.',
                style: KTextStyles.kAppBarTitle(
                  Theme.of(context).accentColor,
                  16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '2. Try Bookify everyday with some new fresh learnings. Consistency is the key to keeping your followers engaged.',
                style: KTextStyles.kAppBarTitle(
                  Theme.of(context).accentColor,
                  16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '3. Liked their learnings? You can buy those books for yourself as well just head over to the books section.',
                style: KTextStyles.kAppBarTitle(
                  Theme.of(context).accentColor,
                  16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
