import 'package:demo_app/models/model_products.dart';
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
      productDescription:
          'This water-free solution contains a 5% concentration of retinoid.',
    ),
    ProductsModel(
      productName: 'Peptide Complex',
      discount: '45',
      image:
          'https://assets.beautyhub.co.ke/wp-content/uploads/2022/11/13120656/cosrx_the_niacinamide_15_serum_20g_2-768x768.jpg',
      price: '102',
      rating: 5,
      productDescription:
          'This water-free solution contains a 5% concentration of retinoid.',
    ),
    ProductsModel(
      productName: 'Active Ceramide Solution',
      discount: '12',
      image:
          'https://skincapedia.com/wp-content/uploads/2024/03/52eb904e85fec28fc6b669c762ac95ff.jpg',
      price: '150',
      rating: 2,
      productDescription:
          'This water-free solution contains a 5% concentration of retinoid.',
    ),
    ProductsModel(
      productName: 'Peptide Complex',
      discount: '50',
      image:
          'https://assets.beautyhub.co.ke/wp-content/uploads/2022/11/13120656/cosrx_the_niacinamide_15_serum_20g_2-768x768.jpg',
      price: '102',
      rating: 3.5,
      productDescription:
          'This water-free solution contains a 5% concentration of retinoid.',
    ),
  ];

}
