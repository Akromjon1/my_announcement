import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import '../pages/home/home_provider.dart';
import '../pages/order/order_provider.dart';

class CategoryView extends StatelessWidget {
  final Category category;

  const CategoryView({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // #products
          Expanded(
            child: GridView.builder(
              physics:  const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: homeProvider.getGridSize(category),
              itemBuilder: (context, index) {
                Product product = category.products[index];
                return AspectRatio(
                  aspectRatio: 3 / 5,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // #image
                          Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () => homeProvider.openDetailPage(context: context, product: product),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),

                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(product.images[0]),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                            child: const Icon(
                                              CupertinoIcons.heart,
                                              color: Colors.black,
                                              size: 27.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      product.discount != null
                                          ? Expanded(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  padding: const EdgeInsets.all(5),
                                                  transform:
                                                      Matrix4.rotationZ(-pi / 20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(7.5),
                                                  ),
                                                  child: Text(
                                                    "-${product.discount! * 100} %",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // #title
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${product.title} ${product.companyName}",
                              maxLines: 2,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          // #price
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                (product.discount != null)
                                    ? Text(
                                        "${product.price} sum",
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    : const SizedBox.shrink(),
                                Text(
                                  "${product.discount != null ? (product.price - product.price * product.discount!) : product.price} sum",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: product.discount != null ? Colors.red : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // #basket
                          // Expanded(
                          //   flex: 4,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(top: 5),
                          //     child: Consumer<OrderProvider>(
                          //       builder: (context, provider, child) {
                          //         bool isBooking = provider.checkProduct(product);
                          //         return ElevatedButton(
                          //           onPressed: () {
                          //             if(isBooking) {
                          //               provider.removeToCart(product);
                          //             } else {
                          //               provider.addToCart(product);
                          //             }
                          //           },
                          //           style: ElevatedButton.styleFrom(
                          //             primary: isBooking ? Colors.red.shade600 : Colors.green.shade600,
                          //             elevation: 0,
                          //             minimumSize: const Size(double.infinity, 30)
                          //           ),
                          //           child: Text("${!isBooking ? "Add" : "Remove"} to cart", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                          //         );
                          //       }
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 3 / 5,
            ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
