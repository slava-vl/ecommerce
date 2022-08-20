import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'init_provider.dart';
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
                      accentColor: const Color.fromRGBO(1, 0, 53, 1),
                      textTheme: const TextTheme(
                        bodySmall: TextStyle(fontWeight: FontWeight.w400),
                        bodyMedium: TextStyle(fontWeight: FontWeight.w500),
                        bodyLarge: TextStyle(fontWeight: FontWeight.w700),
                        headlineLarge: TextStyle(fontWeight: FontWeight.w800),
                      )),
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
