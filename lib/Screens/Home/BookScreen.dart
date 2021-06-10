import 'package:bookify/Widgets/buttons.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          Text(
            'Hi Guest!',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.5,
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 36,
            child: Text(
              'Let’s buy some new books!',
              style: TextStyle(
                color: Color(0xFFC4C4C4),
                fontSize: 20,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(
            height: 4,
            color: Colors.white,
            thickness: 4,
            endIndent: 280,
          ),
          SizedBox(
            height: 25,
          ),
          // TabBar(
          //   controller: _tabController,
          //   indicatorColor: Colors.transparent,
          //   labelColor: Color(0xffffff00),
          //   isScrollable: true,
          //   labelPadding: EdgeInsets.only(right: 45),
          //   unselectedLabelColor: Color(0xffc4c4c4),
          //   tabs: [
          //     Tab(
          //       child: CustomElevatedButton(
          //         onPressedFunction: (){},
          //         child: Text('Finance',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.w600,
          //           letterSpacing: 0.6,
          //         ),),
          //         ),
          //     ),
          //   ],

          //   ),
        ],
      ),
    );
  }
}
