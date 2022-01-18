import 'package:flutter/material.dart';

class ButtomTextMore extends StatelessWidget {
  final VoidCallback seeMoreCallback;

  const ButtomTextMore({Key? key, required this.seeMoreCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: seeMoreCallback,
      child: Text(
        'See more',
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.white,
        textStyle: const TextStyle(
          fontSize: 14,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
