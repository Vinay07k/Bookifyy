import 'package:flutter/material.dart';

import 'package:bookify/sizeconfig.dart';

class AddProfilePicAvatar extends StatelessWidget {
  const AddProfilePicAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: AvatarClipper(),
          child: CircleAvatar(
            radius: getRelativeHeight(0.13),
          ),
        ),
        Positioned(
          bottom: 3,
          right: 4,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                size: 32,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AvatarClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.65, size.height);
    path.cubicTo(
      //First Point
      size.width * 0.55,
      size.height * 0.75,

      //Second Point
      size.width * 0.75,
      size.height * 0.55,

      //End Point
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }
}
