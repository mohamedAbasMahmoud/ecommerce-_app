import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/constant/imageasset.dart';
import 'package:ecommerce_cource/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomItemsCardList extends StatelessWidget {
  const CustomItemsCardList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imageName,
   required this.onAdd,
  required  this.onRemove,
  });
  final String name;
  final String price;
  final String count;
  final String imageName;
  final void Function()? onAdd;
  final void Function()? onRemove;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2, // نسبة المساحة اللي بياخدها الـويدجيت  داخل  الروو
              child: CachedNetworkImage(
                imageUrl: '${AppLink.imageItems}/$imageName',

                height: 80,
              ),
            ),
            // Expanded(child: Image.asset(AppImageAsset.logo)),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name),
                subtitle: Text(
                  price,
                  style: TextStyle(color: AppColor.primaryColor, fontSize: 16),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 35,
                  child: IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                ),
                Container(
                  height: 30,
                  child: Text(count, style: TextStyle(fontFamily: 'sans')),
                ),
                Container(
                  height: 25,
                  child: IconButton(
                    onPressed: onRemove,
                    icon: Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
