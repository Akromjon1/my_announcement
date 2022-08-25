import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_announcement/pages/order/order_page.dart';
import 'package:provider/provider.dart';

import '../history/history_page.dart';
import '../home/home_page.dart';
import '../order/order_provider.dart';
import '../profile/profile_page.dart';
import 'main_provider.dart';

class MainPage extends StatelessWidget {
  static const id = "/main_page";
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      builder: (context, widget) {
        var mainProvider = Provider.of<MainProvider>(context, listen: false);

        return Scaffold(
          body: PageView(
            onPageChanged: mainProvider.onPageChanged,
            controller: mainProvider.pageController,
            children: const [
              HomePage(),
              OrderPage(),
              HistoryPage(),
              ProfilePage(),
            ],
          ),

          bottomNavigationBar: Consumer<MainProvider>(
            builder: (context, main, child) {
              return BottomNavigationBar(
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex: main.currentPage,
                onTap: main.onTapNavigatorIcon,
                items:  [
                  const BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home, color: Colors.black,),
                      label: "Home"
                  ),
                  BottomNavigationBarItem(
                      icon: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(CupertinoIcons.cart, color: Colors.black),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child:  Consumer<OrderProvider>(
                                builder: (context, order, child) {
                                  return Text(order.orderNumber.toString(), style: const TextStyle(color: Colors.white, fontSize: 10),);
                                }
                            ),
                          )
                        ],
                      ),
                      label: "Cart"
                  ),

                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.list_bullet, color: Colors.black,),
                      label: "History"
                  ),

                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.profile_circled, color: Colors.black,),
                      label: "Profile"
                  ),
                ],
              );
            }
          ),
        );
      },
    );
  }
}
