import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget inputtextField(
  String label,
  TextInputType keyboard, {
  int lines = 1,
  bool hiddenText = false,
}) =>
    Center(
      child: Container(
        alignment: Alignment.center,
        height: lines == 1 ? 50 : double.parse('${lines * 30}'),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(31, 31, 31, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          maxLines: lines,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textAlignVertical: TextAlignVertical.center,
          obscureText: hiddenText,
          style: const TextStyle(color: Colors.yellowAccent, fontSize: 18),
          keyboardType: keyboard,
          cursorColor: Colors.yellowAccent,
          cursorHeight: 24,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(196, 196, 196, 1),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent, width: 2),
            ),
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
