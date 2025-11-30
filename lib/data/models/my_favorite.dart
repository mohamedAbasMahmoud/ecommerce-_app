class MyFavoriteModel {
  String? favoriteId;
  String? favoriteItemsid;
  String? favoriteUsersid;
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
  String? usersId;

  MyFavoriteModel({
    this.favoriteId,
    this.favoriteItemsid,
    this.favoriteUsersid,
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
    this.usersId,
  });

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteItemsid = json['favorite_itemsid'];
    favoriteUsersid = json['favorite_usersid'];
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
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_itemsid'] = this.favoriteItemsid;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_desc'] = this.itemDesc;
    data['item_desc_ar'] = this.itemDescAr;
    data['item_image'] = this.itemImage;
    data['item_count'] = this.itemCount;
    data['item_active'] = this.itemActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_time'] = this.itemTime;
    data['item_catg'] = this.itemCatg;
    data['users_id'] = this.usersId;
    return data;
  }
}
