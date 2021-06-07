import '/Screens/HomeScreen.dart' show TABS;
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
      title: Text(
        'Bookify',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Image.asset('assets/drawericon.png'),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ],
      bottom: PreferredSize(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(46, 45, 45, 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => switchTab(TABS.FEEDS),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: currentTab == TABS.FEEDS
                        ? Color.fromRGBO(196, 196, 196, 1)
                        : null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Feeds',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => switchTab(TABS.BOOKS),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: currentTab == TABS.BOOKS
                        ? Color.fromRGBO(196, 196, 196, 1)
                        : null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Books',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size(double.infinity, 30),
      ),
    );
  }
}
