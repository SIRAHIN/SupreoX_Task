import 'dart:convert';

import 'package:get/get.dart';
import 'package:supreox_test_task/model/item_quantity_model.dart';
import 'package:supreox_test_task/model/menu_model.dart';
import 'package:supreox_test_task/services/api_helper.dart';

class AddCartContrller extends GetxController {
  var isLoading = false.obs;
  var menuItemList = <Menu>[].obs;
  
  List<ItemQuantityModel> items = [];
 
  
  var totalItem = 0.obs;

  var subTotalPrice = 0.obs;
  double totaVat = 5.5;
  var totalPrice = 0.obs;

  Future<RxList<Menu>?> fetchAllItems() async {
    isLoading.value = true;
    menuItemList.clear();
    var responseData = await ApiHelper.getAllItems();
    var resultBody = json.decode(responseData);
    if (resultBody != null || resultBody != '') {
      for (var element in resultBody['menu']) {
        menuItemList.add(Menu.fromJson(element));
      }
      isLoading.value = false;
      update();
      return menuItemList;
    } else {
      return null;
    }
  }

  addProducts(Menu menu) {
    late bool isItemExist;
    var items1 = items.where((ab) => menu.id == ab.menu.id).singleOrNull;
    if (items1 == null) {
      isItemExist = false;
    } else {
      isItemExist = true;
    }
    if (!isItemExist) {
      items.add(ItemQuantityModel(menu: menu, quantity: 1));
    } else {
      var item = items.where((ab) => menu.id == ab.menu.id).singleOrNull;
      if (item != null) { 
        item.quantity = item.quantity + 1;
      }   
    }
  calculateTotalPriceAndItem(); 
    update();
  }

  removeProduct(Menu menu) {
    late bool isItemExist;
    var items1 = items.where((ab) => menu.id == ab.menu.id).singleOrNull;
    if (items1 == null) {
      isItemExist = false;
    } else {
      isItemExist = true;
    }
    if (!((items1?.quantity ?? 0) <= 0)) {
      var item = items.where((ab) => menu.id == ab.menu.id).singleOrNull;

      if (item != null) {
        item.quantity = item.quantity - 1;
      }
    }
    calculateTotalPriceAndItem(); 
    update();
  }


     calculateTotalPriceAndItem(){
      subTotalPrice.value = 0;
      for(var item in items){
        subTotalPrice.value = (item.menu.price!) * item.quantity;
      }
      totalPrice.value = subTotalPrice.value + ( subTotalPrice.value * (5.5 / 100)).round();
      update();
 
    }

  // calculateTotalPriceAndItem({required int id}) {
  //  // subTotalPrice.value = int.parse(totalPrice) + subTotalPrice.value;
  //   var totalprice = 0;
  //   var datalist = items.where((ex) => id == ex.menu.id).singleOrNull;
  //   if (datalist != null) {
  //     totalprice = (datalist.menu.price!) * datalist.quantity;
  //   }
  //   // for (var item in items) {
  //   //   subTotalPrice.value = (item.menu.price!) * item.quantity;
  //   //   totalItem.value = item.quantity;
  //   //   update();
  //   // }
  //   subTotalPrice.value = subTotalPrice.value + totalprice;
  //   update();
  // }

  // int countProduct(Menu menu) {
  //   for (var item in items) {
  //     if (item.menu.id == menu.id) {
  //       return item.quantity;
  //     }
  //   }

  //   return 0;
  // }
}
