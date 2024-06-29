
import 'package:get/get.dart';
import 'package:supreox_test_task/routes/routes_name.dart';
import 'package:supreox_test_task/screens/add_to_cart_screen.dart';


List<GetPage<dynamic>>? routes = [
GetPage(name: RoutesName.addToCardScreen, page: () => const AddToCartScreen(),),
];