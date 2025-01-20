import 'package:demo_app/models/model_products.dart';
import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<ProductsModel> itemList = [
    ProductsModel(
        productName: 'Granactive Retinoid',
        discount: '50',
        image:
            'https://beautymone.com/wp-content/uploads/2023/08/DSC-1-11-scaled.jpg',
        price: '150',
        rating: 1,
        addedToCart: false,
        productDescription:
            'This water-free solution contains a 5% concentration of retinoid.',
        productStatus: AppConstants.available),
    ProductsModel(
        productName: 'Peptide Complex',
        discount: '45',
        addedToCart: false,
        image:
            'https://assets.beautyhub.co.ke/wp-content/uploads/2022/11/13120656/cosrx_the_niacinamide_15_serum_20g_2-768x768.jpg',
        price: '102',
        rating: 5,
        productDescription:
            'This water-free solution contains a 5% concentration of retinoid.',
        productStatus: AppConstants.outOfStock),
    ProductsModel(
        productName: 'Active Ceramide Solution',
        discount: '12',
        addedToCart: false,
        image:
            'https://skincapedia.com/wp-content/uploads/2024/03/52eb904e85fec28fc6b669c762ac95ff.jpg',
        price: '150',
        rating: 2,
        productDescription:
            'This water-free solution contains a 5% concentration of retinoid.',
        productStatus: AppConstants.available),
    ProductsModel(
        productName: 'Peptide Complex',
        discount: '50',
        image:
            'https://assets.beautyhub.co.ke/wp-content/uploads/2022/11/13120656/cosrx_the_niacinamide_15_serum_20g_2-768x768.jpg',
        price: '102',
        rating: 3.5,
        addedToCart: false,
        productDescription:
            'This water-free solution contains a 5% concentration of retinoid.',
        productStatus: AppConstants.outOfStock),
    ProductsModel(
        productName: 'Peptide Complex',
        discount: '50',
        image:
            'https://assets.beautyhub.co.ke/wp-content/uploads/2022/11/13120656/cosrx_the_niacinamide_15_serum_20g_2-768x768.jpg',
        price: '102',
        rating: 3.5,
        addedToCart: false,
        productDescription:
            'This water-free solution contains a 5% concentration of retinoid.',
        productStatus: AppConstants.outOfStock),
    ProductsModel(
      productDescription: 'Peptide Complex',
      productName: 'Face care',
      productStatus: AppConstants.available,
      rating: 2,
      discount: '6',
      price: '102',
      addedToCart: false,
      image:
          'https://assets.beautyhub.co.ke/wp-content/uploads/2022/11/13120656/cosrx_the_niacinamide_15_serum_20g_2-768x768.jpg',
    ),
    ProductsModel(
      productName: 'Active Ceramide Solution',
      productDescription: 'Face care',
      discount: '10',
      price: '196',
      rating: 4,
      productStatus: AppConstants.available,
      image:
          'https://skincapedia.com/wp-content/uploads/2024/03/52eb904e85fec28fc6b669c762ac95ff.jpg',
      addedToCart: false,
    ),
  ];

  void addToCart({required BuildContext context, required int index}) {
    var item = itemList[index];
    Provider.of<MyCartProvider>(context, listen: false).itemList.add(
          MyCartModel(
            productName: item.productName,
            discount: item.discount,
            price: double.parse(item.price),
            category: item.productDescription,
            totalPrice: 0,
            quantity: 1,
            image: item.image,
          ),
        );
    item.addedToCart = true;
    AppUtils().getToast(
      'Items Added To Cart Successfully',
    );
    notifyListeners();
  }
}
