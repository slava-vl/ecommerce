import 'package:flutter/material.dart';

import 'components/best_seller_grid.dart';
import 'components/bottom_nav_bar.dart';
import 'components/category_slider.dart';
import 'components/home_app_bar.dart';
import 'components/hot_sales_slider.dart';
import 'components/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBar(),
      body: ListView(
        children: const [
          CategorySlider(),
          SizedBox(height: 30),
          SearchBar(),
          SizedBox(height: 25),
          HotSalesSlider(),
          SizedBox(height: 10),
          BestSellerGrid(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
