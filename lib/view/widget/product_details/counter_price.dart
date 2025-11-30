import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterPrice extends StatelessWidget {
  CounterPrice({
    super.key,
    required this.price,
    required this.count,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  void Function()? onAdd;
  void Function()? onRemove;
  final String price;
  final String count;
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 4, top: 4),
          width: 45,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Text(
            count,
            style: TextStyle(
              color: Colors.black,
              height: .7,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
        Spacer(),
        Text(
          price,
          style: TextStyle(
            color: AppColor.fourthColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
