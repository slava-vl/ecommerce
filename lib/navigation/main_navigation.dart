import 'package:flutter/material.dart';

import '../pages/product_details_page/product_details_page.dart';
import '../pages/splash_page/splash_page.dart';
import '../pages/tabs_page/tabs_page.dart';
import 'main_navigation_route_names.dart';

class MainNavigation {
  Map<String, Widget Function(BuildContext)> get routes => {
        MainNavigationRouteNames.splashRoute: (_) => const SplashPage(),
        MainNavigationRouteNames.tabsRoute: (_) => TabsPage.create(),
        MainNavigationRouteNames.detailsRoute: (_) => ProductDetailsPage.create(),
      };
}
