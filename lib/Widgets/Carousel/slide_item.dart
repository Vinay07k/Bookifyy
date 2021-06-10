import 'package:flutter/material.dart';

import 'package:bookify/Models/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/carousel/${slideList[index].imageUrl}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          slideList[index].title,
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          slideList[index].description,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFFC4C4C4),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
