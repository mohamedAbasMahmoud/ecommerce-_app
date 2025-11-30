class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersRating;
  String? ordersNoterating;
  String? ordersDatetime;
  String? ordersPaymentmethode;
  String? ordersStatus;
  String? addressId;
  String? addressUsersid;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressName;

  OrdersModel({
    this.ordersId,
    this.ordersUsersid,
    this.ordersAddress,
    this.ordersType,
    this.ordersPricedelivery,
    this.ordersPrice,
    this.ordersTotalprice,
    this.ordersCoupon,
    this.ordersRating,
    this.ordersNoterating,
    this.ordersDatetime,
    this.ordersPaymentmethode,
    this.ordersStatus,
    this.addressId,
    this.addressUsersid,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressName,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethode = json['orders_paymentmethode'];
    ordersStatus = json['orders_status'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_paymentmethode'] = this.ordersPaymentmethode;
    data['orders_status'] = this.ordersStatus;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_name'] = this.addressName;
    return data;
  }
}
