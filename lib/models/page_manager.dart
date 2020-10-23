import 'package:flutter/cupertino.dart';

class PageManager {
  PageManager(this._pageController);

  PageController _pageController;


  void setPage(value){
    _pageController.jumpToPage(value);
  }
}