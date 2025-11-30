import 'package:flutter/material.dart';

class customTitle extends StatelessWidget {
  const customTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
