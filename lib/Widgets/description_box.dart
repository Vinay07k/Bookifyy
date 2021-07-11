import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Angel Priya',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
          ),
          Text(
            '@naughtyangle',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(196, 196, 196, 1),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Lorem officia ea exercitation nostrud exercitation exercitation do dolor commodo voluptate est. Id cillum enim ullamco non. Irure eu ipsum ex irure excepteur fugiat irure magna pariatur esse. Et incididunt eiusmod consequat mollit velit tempor consectetur veniam ex consectetur nulla. Sunt est ex veniam cupidatat ad nulla exercitation aliqua qui consequat dolor. Pariatur quis excepteur officia anim culpa anim.',
            style: KTextStyles.kDescriptionText,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.book,
                color: Theme.of(context).focusColor,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                'Joined June 2021',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  // fontSize: 16,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.link,
                color: Theme.of(context).focusColor,
                size: 22,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'https://instagram.com/not',
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    // fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Text(
                  '1500 Followers',
                  style: TextStyle(
                    letterSpacing: 0.8,
                    color: Theme.of(context).accentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '450 Following',
                  style: TextStyle(
                    letterSpacing: 0.8,
                    color: Theme.of(context).accentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).accentColor,
            height: 25,
          ),
        ],
      ),
    );
  }
}
