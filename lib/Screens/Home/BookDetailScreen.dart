import 'package:bookify/Widgets/Books/price_box.dart';
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/constants.dart';
import 'package:bookify/sizeconfig.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatefulWidget {
  static final routeName = '/book-detail';
  const BookDetailScreen({Key? key}) : super(key: key);

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool isFavourite = false;

  void toggleFavourite() => setState(() => isFavourite = !isFavourite);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: toggleFavourite,
              icon: Icon(
                isFavourite ? Icons.bookmark : Icons.bookmark_add_outlined,
                color: Theme.of(context).focusColor,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: getRelativeHeight(0.4),
              color: Color.fromRGBO(105, 47, 47, 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://m.media-amazon.com/images/I/51AHZGhzZEL.jpg',
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: getRelativeHeight(0.34),
                  ),
                  Container(
                    // height: getRelativeHeight(0.7),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(
                      // vertical: 12,
                      horizontal: 18,
                    ),
                    // height: getRelativeHeight(0.6),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        Text(
                          'Rich Dad Poor Dad',
                          style: KTextStyles.kAppBarTitle(
                            Theme.of(context).accentColor,
                            28,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Robert Kiyosaki',
                              style: KTextStyles.kSubTitle,
                            ),
                            const SizedBox(width: 10),
                            PriceBox(108),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'About the book :',
                          style: KTextStyles.kAppBarTitle(
                            Theme.of(context).accentColor,
                            22,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Labore labore aliquip exercitation nostrud sit tempor esse amet voluptate aliquip minim quis pariatur nisi. Reprehenderit ullamco nulla et incididunt fugiat adipisicing Lorem pariatur occaecat aute. Eu id est duis Lorem veniam culpa voluptate Lorem nostrud anim et. Ad occaecat Lorem commodo amet in pariatur dolore. Proident ullamco in irure elit et. Voluptate et consectetur sunt do excepteur officia adipisicing exercitation magna eiusmod aliqua cupidatat.',
                          style: KTextStyles.kSubTitle,
                        ),
                        const SizedBox(height: 10),
                        CustomElevatedButton(
                          onPressedFunction: () {},
                          child: Text(
                            'Buy Now',
                            style: KTextStyles.kButtonText,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
