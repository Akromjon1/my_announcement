import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide ChangeNotifier;
import 'package:my_announcement/pages/main/main_page.dart';

class IntroProvider extends ChangeNotifier{
  PageController pageController = PageController(keepPage: true);
  int currentPage = 0;

  void onButtonTap(int index, context) {
    currentPage = index;
    currentPage != 2 ?
    pageController.jumpToPage(index + 1):Navigator.pushNamed(context, MainPage.id);
    notifyListeners();
  }

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }
}