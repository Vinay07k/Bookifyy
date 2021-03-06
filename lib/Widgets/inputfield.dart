import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget inputtextField({
  String? label,
  TextInputType? keyboard,
  TextEditingController? controller,
  int lines = 1,
  bool hiddenText = false,
  String? prefixtext,
  bool disable = false,
  TextInputAction? textInputAction,
  FocusNode? focusNode,
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
          focusNode: focusNode,
          textInputAction: textInputAction,
          readOnly: disable,
          controller: controller,
          maxLines: lines,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textAlignVertical: TextAlignVertical.center,
          obscureText: hiddenText,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          keyboardType: keyboard,
          cursorColor: Colors.white,
          cursorHeight: 24,
          decoration: InputDecoration(
            prefixIcon: prefixtext != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      prefixtext,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  )
                : null,
            // prefixText: 'prefixtext',
            // prefixStyle: TextStyle(
            //   color: Colors.white,
            // ),
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
