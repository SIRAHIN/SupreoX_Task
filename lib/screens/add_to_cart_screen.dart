import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supreox_test_task/controller/add_cart_contrller.dart';
import 'package:supreox_test_task/model/menu_model.dart';
import 'package:supreox_test_task/style/style.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Responsive Height and Width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final controllerCart = Get.find<AddCartContrller>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * .11,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            primaryOrangeColor,
                            primaryYellowColor,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'BreakFast',
                                      style: Head1Text(Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                      child: Icon(
                                        Icons.keyboard_arrow_up_sharp,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Vat(5%) Service Charge(5%)',
                                  style: Head2Text(Colors.white.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: controllerCart.fetchAllItems(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                              var itemData = snapshot.data![index];
                                return ListTile(
                                  title: Text(
                                    "${itemData.name}",
                                    style: TileHead1Text(deepTextColor),
                                  ),
                                  subtitle:
                                       Text('${itemData.description}'),
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${itemData.price}',
                                        style: Head7Text(lightTextColor),
                                      ),
                                    
                                      GetBuilder<AddCartContrller>(
                                      builder: (controller) => 
                                       (controller.items.where((ex)=> itemData.id == ex.menu.id).singleOrNull?.quantity ?? 0) == 0 ?  InkWell(
                                       onTap: () {
                                         controller.addProducts(itemData);
                                       },
                                         child: Container(
                                            alignment: Alignment.center,
                                            height: screenHeight * 0.03,
                                            width: screenWidth * 0.15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                border: Border.all(
                                                    color: primaryYellowColor)),
                                            child: const Text('Add'),
                                          ),
                                       ) : AddorRemoveItemCount(screenHeight: screenHeight, screenWidth: screenWidth, menu: itemData),
                                      )
                                    ],
                                  ),
                                  leading: Container(
                                    height: screenHeight * .50,
                                    width: screenWidth * .15,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12.0)),
                                        border: Border.all(
                                            color: primaryYellowColor)),
                                    child: CircleAvatar(
                                     backgroundImage: NetworkImage('${itemData.image}'),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: screenHeight * .02,
                                );
                              },
                              itemCount: controllerCart.menuItemList.length);
                        } else {
                          return Container();
                        }
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: screenHeight * .20,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: secondaryBgColor),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GetBuilder<AddCartContrller>(
                  builder: (controller) => 
                     Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemPriceText(
                          titleText: 'Subtotal',
                          priceText: '${controller.subTotalPrice.value}',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vat(5%) Service Charge included (5%)',
                              style: Head7Text(lightTextColor),
                            ),
                            Text(
                              '\$5.5',
                              style: Head1Text(lightTextColor),
                            ),
                          ],
                        ),
                        Divider(
                          color: primaryYellowColor,
                        ),
                        ItemPriceText(priceText: controller.totalPrice.toString(), titleText: 'Total' )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemPriceText extends StatelessWidget {
  String titleText;
  String priceText;
  ItemPriceText({
    required this.priceText,
    required this.titleText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: Head1Text(deepTextColor),
        ),
        Text(
          '\$$priceText',
          style: Head1Text(primaryYellowColor),
        ),
      ],
    );
  }
}

class AddorRemoveItemCount extends StatelessWidget {
   AddorRemoveItemCount({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.menu
  });

  final double screenHeight;
  final double screenWidth;
  Menu menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      height: screenHeight * 0.03,
      width: screenWidth * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: primaryYellowColor)),
      child: GetBuilder<AddCartContrller>(
      builder: (controller) => 
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
            onTap: () {
             controller.removeProduct(menu);
            },
                child: Icon(
              Icons.remove,
              size: 15,
              color: lightTextColor,
            )),
            Text('${controller.items.where((ex)=> menu.id == ex.menu.id).singleOrNull?.quantity ?? 0}' ),
            InkWell(
            onTap: () {
              controller.addProducts(menu);
            },
              child: Icon(
                Icons.add,
                size: 15,
                color: lightTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
