import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backGroundColor: AppColors.colorF9F9F9,
      appbar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColors.colorWhite,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<MyCartProvider>(
        builder: (context, provider, __) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: provider.itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = provider.itemList[index];
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        padding: EdgeInsets.all(
                          10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: AppNetworkImage(
                                image: item.image,
                                height: 75,
                                width: 110,
                                fit: BoxFit.cover,
                                errorWidget: Image.asset(
                                  'assets/images/img_no_image_available.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.productName,
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      item.category,
                                      style: TextStyle(
                                        color: AppColors.color6C6B6B,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            // '\$${item.price.toString()}',
                                            '\$${item.price * item.quantity}',
                                            style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 35,
                                          width: 100,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: AppColors.colorF5F5F5,
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              quantityButton(
                                                icon: Icons.remove,
                                                onTap: () => provider.decrement(
                                                  index,
                                                ),
                                              ),
                                              Text(
                                                item.quantity.toString(),
                                                style: TextStyle(
                                                  color: AppColors.textColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              quantityButton(
                                                icon: Icons.add,
                                                onTap: () => provider.increment(
                                                  index,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                AppButton(
                  onPressed: () {
                    AppPopUp.bottomSheet(
                      context: context,
                      body: checkOut(
                        totalAmount: provider.total.toString(),
                      ),
                    );
                  },
                  padding: EdgeInsets.only(
                    bottom: 15,
                  ),
                  name: 'Proceed To Checkout',
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget quantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 22,
          color: Color(0xFFDED7D7),
        ),
      ),
    );
  }

  Widget checkOut({required String totalAmount}) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.zero,
      ),
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.colorF5F5F5,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Total :',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  '\$${totalAmount.toString()}',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          AppButton(
            padding: EdgeInsets.only(
              top: 30,
              bottom: 60,
            ),
            onPressed: () {},
            name: 'CheckOut',
          )
        ],
      ),
    );
  }
}
