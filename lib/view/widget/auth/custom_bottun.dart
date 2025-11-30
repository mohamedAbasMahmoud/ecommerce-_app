import 'package:flutter/material.dart';

class CustomBottun extends StatelessWidget {
  CustomBottun({
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
        height: 50,
        width: double.infinity,
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
