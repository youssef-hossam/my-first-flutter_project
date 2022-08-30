import 'package:flutter/material.dart';

class OriginalButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final Color textColor;
  final Color bgColor;

  const OriginalButton(
      {Key? key,
    required this.text,
    required this.onpressed,
    required this.textColor,
    required this.bgColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        color: bgColor,
        onPressed: onpressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: 18
          ),
        ),
      ),
    );
  }
}
