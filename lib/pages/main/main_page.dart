import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page.dart';
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
              // CartPage(),
              // OrdersPage(),
              // WalletPage(),
              // ProfilePage(),
            ],
          ),

          bottomNavigationBar: Consumer<MainProvider>(
              builder: (context, main, child) {
                return BottomNavigationBar(
                  currentIndex: main.currentPage,
                  onTap: main.onTapNavigatorIcon,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.home),
                        label: "Home"
                    ),

                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.list_bullet),
                        label: "History"
                    ),

                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.profile_circled),
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