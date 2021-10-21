import 'package:flutter/material.dart';

class BlurbCountWidget extends StatelessWidget {
  const BlurbCountWidget({
    Key? key,
    required this.blurbCount,
  }) : super(key: key);

  final int blurbCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.star,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 3),
          Text(
            blurbCount.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
