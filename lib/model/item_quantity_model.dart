import 'package:supreox_test_task/model/menu_model.dart';

class ItemQuantityModel {

  late Menu menu;
  late int quantity;

  ItemQuantityModel({required this.menu, required this.quantity});

  ItemQuantityModel.fromJson (Map<String, dynamic> json){
    menu = Menu.fromJson(json['products']);
    quantity= json['quantity'] as int;
  }


}