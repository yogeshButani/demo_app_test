import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class MyCartProvider extends ChangeNotifier {
  List<MyCartModel> itemList = [
    MyCartModel(
      productName: 'Granactive Retinoid',
      category: 'Face care',
      discount: '50',
      price: 125,
      quantity: 1,
      image:
          'https://beautymone.com/wp-content/uploads/2023/08/DSC-1-11-scaled.jpg',
      totalPrice: 0,
    ),

  ];

  void increment(int index) {
    itemList[index].quantity++;
    updateTotalPrice(index);
    notifyListeners();
  }

  void decrement(int index) {
    if (itemList[index].quantity > 1) {
      itemList[index].quantity--;
      updateTotalPrice(index);
    }
    notifyListeners();
  }

  double _total = 0;

  double get total => _total;

  void updateTotalPrice(int index) {
    final double itemPrice = itemList[index].price;
    itemList[index].totalPrice = itemPrice * itemList[index].quantity;
    _total = itemList.fold(0, (sum, item) => sum + item.totalPrice);
    notifyListeners();
  }
}
