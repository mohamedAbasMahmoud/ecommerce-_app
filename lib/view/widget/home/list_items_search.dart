
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_cource/controller/home_controller.dart';
import 'package:ecommerce_cource/data/models/items_model.dart';
import 'package:ecommerce_cource/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.goToProductDetails(listdatamodel[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${listdatamodel[index].itemImage}",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(listdatamodel[index].itemName!),
                        subtitle: Text(listdatamodel[index].categoriesName!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}