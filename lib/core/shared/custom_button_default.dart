
import 'package:flutter/material.dart';

class CustomBottunDefault extends StatelessWidget {
  CustomBottunDefault({
    super.key,
    this.onTap,
    required this.title,
    required this.color,
  });
  String title;
  VoidCallback? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),

          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
