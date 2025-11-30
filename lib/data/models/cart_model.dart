class CartModel {
  final String? status;
  final List<CartItemsModel>? data;
  final int? totalPrice;

  CartModel({this.status, this.data, this.totalPrice});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    status: json["status"] as String?,
    data: json["data"] == null
        ? null
        : List<CartItemsModel>.from(
            json["data"].map((x) => CartItemsModel.fromJson(x)),
          ),
    totalPrice: json["totalPrice"] as int?,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data != null
        ? List<dynamic>.from(data!.map((x) => x.toJson()))
        : null,
    "totalPrice": totalPrice,
  };
}

class CartItemsModel {
  final int? id;
  final String? userId;
  final String? itemId;
  final String? quantity;
  final String? price;
  final String? serviceType;
  final dynamic image;
  final dynamic information;
  final dynamic orderId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic operationNote;
  final String? isChecked;
  final Item? item;

  CartItemsModel({
    this.id,
    this.userId,
    this.itemId,
    this.quantity,
    this.price,
    this.serviceType,
    this.image,
    this.information,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.operationNote,
    this.isChecked,
    this.item,
  });

  factory CartItemsModel.fromJson(Map<String, dynamic> json) => CartItemsModel(
    id: json["id"] as int?,
    userId: json["user_id"] as String?,
    itemId: json["item_id"] as String?,
    quantity: json["quantity"] as String?,
    price: json["price"] as String?,
    serviceType: json["service_type"] as String?,
    image: json["image"],
    information: json["information"],
    orderId: json["order_id"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.tryParse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.tryParse(json["updated_at"]),
    operationNote: json["operation_note"],
    isChecked: json["is_checked"] as String?,
    item: json["item"] == null ? null : Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "item_id": itemId,
    "quantity": quantity,
    "price": price,
    "service_type": serviceType,
    "image": image,
    "information": information,
    "order_id": orderId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "operation_note": operationNote,
    "is_checked": isChecked,
    "item": item?.toJson(),
  };
}

class Item {
  final int? id;
  final String? categoryId;
  final String? nameEn;
  final String? nameAr;
  final String? image;
  final String? price;
  final String? dryPrice;
  final String? dryB2BPrice;
  final String? washPrice;
  final String? washB2BPrice;
  final String? fixPrice;
  final String? fixB2BPrice;
  final String? ironPrice;
  final String? ironB2BPrice;
  final String? washAndIronPrice;
  final String? washAndIronB2BPrice;
  final String? deepCleaningPrice;
  final String? deepCleaningB2BPrice;
  final String? laundryPrice;
  final String? discount;
  final String? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Item({
    this.id,
    this.categoryId,
    this.nameEn,
    this.nameAr,
    this.image,
    this.price,
    this.dryPrice,
    this.dryB2BPrice,
    this.washPrice,
    this.washB2BPrice,
    this.fixPrice,
    this.fixB2BPrice,
    this.ironPrice,
    this.ironB2BPrice,
    this.washAndIronPrice,
    this.washAndIronB2BPrice,
    this.deepCleaningPrice,
    this.deepCleaningB2BPrice,
    this.laundryPrice,
    this.discount,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] as int?,
    categoryId: json["category_id"] as String?,
    nameEn: json["name_en"] as String?,
    nameAr: json["name_ar"] as String?,
    image: json["image"] as String?,
    price: json["price"] as String?,
    dryPrice: json["dry_price"] as String?,
    dryB2BPrice: json["dry_b2b_price"] as String?,
    washPrice: json["wash_price"] as String?,
    washB2BPrice: json["wash_b2b_price"] as String?,
    fixPrice: json["fix_price"] as String?,
    fixB2BPrice: json["fix_b2b_price"] as String?,
    ironPrice: json["iron_price"] as String?,
    ironB2BPrice: json["iron_b2b_price"] as String?,
    washAndIronPrice: json["wash_and_iron_price"] as String?,
    washAndIronB2BPrice: json["wash_and_iron_b2b_price"] as String?,
    deepCleaningPrice: json["deep_cleaning_price"] as String?,
    deepCleaningB2BPrice: json["deep_cleaning_b2b_price"] as String?,
    laundryPrice: json["laundry_price"] as String?,
    discount: json["discount"] as String?,
    isActive: json["is_active"] as String?,
    createdAt: json["created_at"] == null
        ? null
        : DateTime.tryParse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.tryParse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name_en": nameEn,
    "name_ar": nameAr,
    "image": image,
    "price": price,
    "dry_price": dryPrice,
    "dry_b2b_price": dryB2BPrice,
    "wash_price": washPrice,
    "wash_b2b_price": washB2BPrice,
    "fix_price": fixPrice,
    "fix_b2b_price": fixB2BPrice,
    "iron_price": ironPrice,
    "iron_b2b_price": ironB2BPrice,
    "wash_and_iron_price": washAndIronPrice,
    "wash_and_iron_b2b_price": washAndIronB2BPrice,
    "deep_cleaning_price": deepCleaningPrice,
    "deep_cleaning_b2b_price": deepCleaningB2BPrice,
    "laundry_price": laundryPrice,
    "discount": discount,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
