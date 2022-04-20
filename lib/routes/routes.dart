import 'package:get/route_manager.dart';
import 'package:pos_and_ecommerce/screen/pos/admin_page.dart';
import 'package:pos_and_ecommerce/screen/pos/sales_analysis.dart';
import 'package:pos_and_ecommerce/screen/pos/coupon_management.dart';

import '../binding/manage_binding.dart';
import '../binding/upload_binding.dart';
import '../intro_screen.dart';
import '../screen/blue_tooth_screen.dart';
import '../screen/check_out_screen.dart';
import '../screen/detail_screen.dart';
import '../screen/home_screen.dart';
import '../screen/item_upload_screen.dart';
import '../screen/manage_item.dart';
import '../screen/pos/inventory_management.dart';
import '../screen/purchase_screen.dart';
import '../screen/search_screen.dart';

const String introScreen = '/intro-screen';
const String homeScreen = '/home';
const String checkOutScreen = '/checkout';
const String detailScreen = '/detail';
const String uploadItemScreen = '/uploadItemScreen';
const String mangeItemScreen = '/manage-item';
const String purchaseScreen = '/purchase-screen';
const String blueToothScreen = '/bluetooth-screen';
const String searchScreen = '/searchScreen';
const posUrl = "/pos_url";
const loginUrl = "/login_url";
const salesUrl = "/sales_url";
const inventoryUrl = "/inventory_url";
const couponUrl = "/coupon_url";

List<GetPage> routes = [
  GetPage(
    name: introScreen,
    page: () => OnBoardingPage(),
  ),
  GetPage(
    name: homeScreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: checkOutScreen,
    page: () => CheckOutScreen(),
  ),
  GetPage(
    name: detailScreen,
    page: () => DetailScreen(),
  ),
  GetPage(
    name: uploadItemScreen,
    page: () => UploadItem(),
    binding: UploadBinding(),
  ),
  GetPage(
    name: mangeItemScreen,
    page: () => ManageItem(),
    binding: ManageBinding(),
  ),
  GetPage(
    name: purchaseScreen,
    page: () => PurchaseScreen(),
  ),
  GetPage(
    name: blueToothScreen,
    page: () => BlueToothPrintScreen(),
  ),
  GetPage(
    name: searchScreen,
    page: () => SearchScreen(),
  ),
  GetPage(
    name: posUrl,
    page: () => const POSPage(),
  ),
  GetPage(
    name: inventoryUrl,
    page: () => const InventoryManagement(),
  ),
  GetPage(
    name: salesUrl,
    page: () => const SalesAnalysis(),
  ),
  GetPage(
    name: couponUrl,
    page: () => const CouponManagement(),
  ),
];
