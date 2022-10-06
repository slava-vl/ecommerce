import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import 'data/api_client.dart';
import 'domain/services/cart_data_service.dart';
import 'domain/services/home_data_service.dart';
import 'domain/services/product_detail_data_service.dart';
import 'navigation/main_navigation.dart';
import 'navigation/main_navigation_route_names.dart';
import 'pages/cart_page/cart_page_model.dart';
import 'pages/home_page/home_page_model.dart';

class AppInitialization extends StatelessWidget {
  const AppInitialization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InitializeProvider(),
      child: Builder(builder: (context) {
        return FutureBuilder(
          future: context.read<InitializeProvider>().initializeApp(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            } else {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (_) =>
                        HomePageViewModel(homeDataService: context.read<InitializeProvider>().homeDataService),
                    lazy: false,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => CartPageViewModel(cartDataSrvice: context.read<InitializeProvider>().cartDataSrvice),
                    lazy: false,
                  )
                ],
                child: MaterialApp(
                  title: 'Ecommerce',
                  theme: ThemeData(
                      scaffoldBackgroundColor: const Color.fromRGBO(248, 248, 248, 1),
                      primaryColor: const Color.fromRGBO(255, 110, 78, 1),
                      textTheme: const TextTheme(
                        bodySmall: TextStyle(fontWeight: FontWeight.w400),
                        bodyMedium: TextStyle(fontWeight: FontWeight.w500),
                        bodyLarge: TextStyle(fontWeight: FontWeight.w700),
                        headlineLarge: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color.fromRGBO(1, 0, 53, 1))),
                  routes: context.read<InitializeProvider>().navigation.routes,
                  initialRoute: MainNavigationRouteNames.splashRoute,
                ),
              );
            }
          },
        );
      }),
    );
  }
}

class InitializeProvider with ChangeNotifier {
  late final MainNavigation _navigation;
  MainNavigation get navigation => _navigation;

  late final ApiClient _apiClient;
  ApiClient get apiClient => _apiClient;

  late final HomeDataService _homeDataService;
  HomeDataService get homeDataService => _homeDataService;

  late final ProductDetailDataSrvice _productDetailDataSrvice;
  ProductDetailDataSrvice get productDetailDataSrvice => _productDetailDataSrvice;

  late final CartDataSrvice _cartDataSrvice;
  CartDataSrvice get cartDataSrvice => _cartDataSrvice;

  Future<void> initializeApp() async {
    _navigation = MainNavigation();
    _apiClient = ApiClient(Dio());
    _homeDataService = HomeDataService(apiClient: _apiClient);
    _productDetailDataSrvice = ProductDetailDataSrvice(apiClient: _apiClient);
    _cartDataSrvice = CartDataSrvice(apiClient: _apiClient);
  }
}
