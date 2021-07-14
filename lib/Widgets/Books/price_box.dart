import 'package:flutter/material.dart';

class PriceBox extends StatelessWidget {
  const PriceBox(this.price, {Key? key}) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
        ),
        child: Text(
          'Rs. ${price.toString()}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(6),
      color: Theme.of(context).focusColor,
    );
  }
}
