import 'package:flutter/material.dart';

class BarApp extends StatelessWidget {
  const BarApp({super.key, required this.text, required this.icon});
  final String text ;
  final IconData icon ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: () {},
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: Icon(icon),
        ),
      ],
    );
  }
}
