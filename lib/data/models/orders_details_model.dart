class OrdersDetailsModel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
  String? cartOrders;
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  String? itemCount;
  String? itemActive;
  String? itemPrice;
  String? itemDiscount;
  String? itemTime;
  String? itemCatg;

  OrdersDetailsModel({
    this.itemsprice,
    this.countitems,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
    this.cartOrders,
    this.itemId,
    this.itemName,
    this.itemNameAr,
    this.itemDesc,
    this.itemDescAr,
    this.itemImage,
    this.itemCount,
    this.itemActive,
    this.itemPrice,
    this.itemDiscount,
    this.itemTime,
    this.itemCatg,
  });

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemTime = json['item_time'];
    itemCatg = json['item_catg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = itemsprice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_usersid'] = cartUsersid;
    data['cart_itemsid'] = cartItemsid;
    data['cart_orders'] = cartOrders;
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_desc'] = itemDesc;
    data['item_desc_ar'] = itemDescAr;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_time'] = itemTime;
    data['item_catg'] = itemCatg;
    return data;
  }
}
