import 'package:google_fonts/google_fonts.dart';

import '../../Screens/ScreenController.dart' show TABS;
import 'package:flutter/material.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar(
    this.switchTab,
    this.currentTab, {
    Key? key,
  }) : super(key: key);

  final void Function(TABS) switchTab;
  final TABS currentTab;

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Image.asset('assets/drawericon.png'),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      title: Text(
        'Bookify',
        style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
        ),
      ],
      bottom: PreferredSize(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromRGBO(46, 45, 45, 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              tabButtons(
                  () => switchTab(TABS.FEEDS), TABS.FEEDS, currentTab, 'Feeds'),
              tabButtons(
                  () => switchTab(TABS.BOOKS), TABS.BOOKS, currentTab, 'Books'),
            ],
          ),
        ),
        preferredSize: const Size(double.infinity, 30),
      ),
    );
  }
}

Widget tabButtons(
  void Function() onPressedFunc,
  TABS tab,
  TABS currentTab,
  String label,
) =>
    GestureDetector(
      onTap: onPressedFunc,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: double.infinity,
        decoration: BoxDecoration(
          color: currentTab == tab ? Color.fromRGBO(196, 196, 196, 1) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
