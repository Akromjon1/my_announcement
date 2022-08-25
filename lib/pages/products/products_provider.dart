import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../../services/mock_data.dart';
import '../detail/datail_page.dart';
import '../order/order_page.dart';


class ProductsProvider extends ChangeNotifier {
  late Category category;
  late List <Category> categoryList;
   List <Product> productList = [];
   List <Product> productList2 = [];

  ProductsProvider() {
    getCategory();
    getProductList();
  }

  void getCategory() {
    productList.addAll(productsMock.map((e) => Product.fromJson(e)).toList());
  }
      //.firstWhere((category) => categoryId == category["id"]),
  // void getProducts() {
  //   productList2.add(productList.map((e) => e.discount != null));
  // }
  void getProductList(){
    for(int i = 0; i < productList.length; i++){
      if(productList[i].discount != null){
        productList2.add(productList[i]);
      }
    }
  }
  void onTapBasket({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
  }

  void openDetailPage({required BuildContext context, required Product product}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(product: product)));
  }
}