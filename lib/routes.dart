import 'package:ecommerce_cource/controller/address/details_address_controller.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/middle_ware/my_middle_ware.dart';
import 'package:ecommerce_cource/view/address/add.dart';
import 'package:ecommerce_cource/view/address/details_address.dart';
import 'package:ecommerce_cource/view/address/view.dart';
import 'package:ecommerce_cource/view/screen/auth/foget_pass/forget_password.dart';
import 'package:ecommerce_cource/view/screen/auth/foget_pass/veryfy_code_sign_up.dart';
import 'package:ecommerce_cource/view/screen/auth/login.dart';
import 'package:ecommerce_cource/view/screen/auth/foget_pass/reset_password.dart';
import 'package:ecommerce_cource/view/screen/auth/sign_up.dart';
import 'package:ecommerce_cource/view/screen/auth/foget_pass/success_reset_password.dart';
import 'package:ecommerce_cource/view/screen/auth/foget_pass/success_sign_up.dart';
import 'package:ecommerce_cource/view/screen/auth/foget_pass/veryFayCode.dart';
import 'package:ecommerce_cource/view/screen/bottom_appbar_screen.dart/offers_screen.dart';
import 'package:ecommerce_cource/view/screen/bottom_appbar_screen.dart/settings_screen.dart';
import 'package:ecommerce_cource/view/screen/cart.dart';
import 'package:ecommerce_cource/view/screen/checkout.dart';
import 'package:ecommerce_cource/view/screen/mian_screen.dart';
import 'package:ecommerce_cource/view/screen/language.dart';
import 'package:ecommerce_cource/view/screen/onboarding.dart';
import 'package:ecommerce_cource/view/screen/orders/archive_orders.dart';
import 'package:ecommerce_cource/view/screen/orders/finiched_archive.dart';
import 'package:ecommerce_cource/view/screen/orders/orders_details.dart';
import 'package:ecommerce_cource/view/screen/orders/waiting_pending.dart';
import 'package:ecommerce_cource/view/screen/product_details.dart';
import 'package:ecommerce_cource/view/widget/home/items.dart';
import 'package:ecommerce_cource/view/widget/home/my_favorite_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const LanguageScreen(),
    middlewares: [MyMiddleWare()], //اول ظهور
  ),
  GetPage(name: AppRoutes.cart, page: () => Cart()),
  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),

  GetPage(name: AppRoutes.mainScreen, page: () => const MainScreen()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verfayCode, page: () => const VeryFiyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnboardingScreen()),
  GetPage(
    name: AppRoutes.veryfiyCodeSignUp,
    page: () => const VeryFiyCodeSignUp(),
  ),
  GetPage(name: AppRoutes.items, page: () => const Items()),

  GetPage(name: AppRoutes.myFavorite, page: () => const MyFavoriteScreen()),
  GetPage(name: AppRoutes.settingsScreen, page: () => const Settings()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  GetPage(name: AppRoutes.addressAdd, page: () => const addressAdd()),
  GetPage(name: AppRoutes.addressview, page: () => const AddressView()),
  GetPage(name: AppRoutes.detailsAddress, page: () => const DetailsAddress()),
  GetPage(name: AppRoutes.checkout, page: () => const CheckOutScreen()),
  GetPage(
    name: AppRoutes.waitingorders,
    page: () => const WaitingOrdersScreen(),
  ),
  GetPage(name: AppRoutes.finishedorders, page: () => const FinichedArchive()),

  GetPage(name: AppRoutes.ordersdetails, page: () => const OrdersDetails()),

  GetPage(name: AppRoutes.archiveOrders, page: () => const OrdersArchiveView()),
];
