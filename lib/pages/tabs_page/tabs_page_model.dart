import 'package:flutter/cupertino.dart';

class TabsPageViewModel with ChangeNotifier {
  List<BottomNavBarItem> navBarItems = [
    BottomNavBarItem(id: 0, title: 'Explorer', ico: 'assets/computer.svg'),
    BottomNavBarItem(id: 1, title: 'Cart', ico: 'assets/shop.svg'),
    BottomNavBarItem(id: 2, title: 'Favourites', ico: 'assets/unlike.svg'),
    BottomNavBarItem(id: 3, title: 'Profile', ico: 'assets/profile.svg'),
  ];

  PageController pageController = PageController();

  int selectedNavBarIndex = 0;

  void changeSelectedNavBarIndex(int index) {
    selectedNavBarIndex = index;
    pageController.animateToPage(
      index,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
    );
    notifyListeners();
  }
}

class BottomNavBarItem {
  final int id;
  final String title;
  final String ico;
  BottomNavBarItem({
    required this.id,
    required this.title,
    required this.ico,
  });
}
