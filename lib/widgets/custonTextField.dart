import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final int lines;
  final int length;
  final TextInputType type;


  const CustomTextField({Key key, this.controller, this.text, this.lines, this.type, this.length}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: length,
      maxLines: lines,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
