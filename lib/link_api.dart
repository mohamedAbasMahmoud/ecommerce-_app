class AppLink {
  /////////php links
  //static const String ip = "192.168.0.198";//home
  //192.168.189.139 samsung// tiqnia =192.168.1.72///adb connect 192.168.1.18:34613
//http://localhost/phpmyadmin/index.php?route=/sql&db=ecommerce&table=orders&pos=0
  static const String basicUrl = "http://192.168.1.72/ecommerce";

  static const String test = "$basicUrl/test.php";

  //---------------------image----------------------------------------
  static const String imageStatic = "$basicUrl/upload";

  static const String imageCategories = "$basicUrl/upload/categories";
  static const String imageItems = "$basicUrl/upload/items";

  //---------------------Auth-------------------------------------------

  static const String signUp = "$basicUrl/auth/signup.php";

  static const String login = "$basicUrl/auth/login.php";
  //--------------------home------------------------------------------
  static const String homeScreen = "$basicUrl/home.php";
  //--------------------home---------------------------------------------

  static const String items = "$basicUrl/items/items.php";
  //-------------------- Favorite------------------------------------

  static const String favoriteAdd = "$basicUrl/favorite/add.php";
  static const String favoriteRemove = "$basicUrl/favorite/remove.php";
  static const String favoriteView = "$basicUrl/favorite/view.php";
  static const String deleteFromFavorite =
      "$basicUrl/favorite/deletefromfavroite.php";

  // Cart
  static const String cartview = "$basicUrl/cart/view.php";
  static const String cartadd = "$basicUrl/cart/add.php";
  static const String cartdelete = "$basicUrl/cart/delete.php";
  static const String cartgetcountitems = "$basicUrl/cart/getcountitems.php";
  //search
  static const String searchitems = "$basicUrl/items/search.php";
  // Address

  static const String addressView = "$basicUrl/address/view.php";
  static const String addressAdd = "$basicUrl/address/add.php";
  static const String addressEdit = "$basicUrl/address/edit.php";
  static const String addressDelete = "$basicUrl/address/delete.php";
  //coupon
  static const String checkCoupon = "$basicUrl/coupon/checkcoupon.php";
  //orders//checkout
  static const String checkOrders = "$basicUrl/orders/checkout.php";
  static const String ordersDoneForWaiting = "$basicUrl/orders/orders.php";
  static const String ordersDetails = "$basicUrl/orders/details.php";
  static const String deleteOrders = "$basicUrl/orders/delete.php";
  static const String archiveOrders = "$basicUrl/orders/archive.php";
  //offers-

  static const String offers = "$basicUrl/orders/offers.php";
  //rating
  static const String rating = "$basicUrl/orders/rating_dialog.php";
}
