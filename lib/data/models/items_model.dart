class ItemsModel {
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
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesDateTime;
  String? categoriesImage;
  String? favorite;
  String? itemPriceDiscount;

  ItemsModel({
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
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesDateTime,
    this.categoriesImage,
    this.favorite,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesDateTime = json['categories_date_time'];
    categoriesImage = json['categories_image'];
    favorite = json['favorite'];
    itemPriceDiscount = json['itempricediscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_date_time'] = this.categoriesDateTime;
    data['categories_image'] = this.categoriesImage;
    return data;
  }
}
