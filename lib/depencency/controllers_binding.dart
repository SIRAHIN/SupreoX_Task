import 'package:get/get.dart';
import 'package:supreox_test_task/controller/add_cart_contrller.dart';

class ControllerBindings extends Bindings {

 @override
 void dependencies() {
   Get.lazyPut<AddCartContrller>(() => AddCartContrller(), fenix: true);
 }
}