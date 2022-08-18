// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../app_initialization.dart';
// import '../domain/models/connected_service_model.dart';
// import '../m2_app.dart';
// import '../pages/home_page/home_page.dart';
// import '../pages/home_page/home_page_model.dart';
// import '../pages/login_page/login_page.dart';
// import '../pages/login_page/login_page_model.dart';
// import '../pages/my_tariffs_page/my_tariffs_page.dart';
// import '../pages/my_tariffs_page/my_tariffs_page_model.dart';
// import '../pages/services_page/services_page.dart';
// import '../pages/services_page/services_page_model.dart';
// import '../pages/tabs_page/tabs_page.dart';
// import '../pages/tabs_page/tabs_page_model.dart';
// import '../pages/tariffs_page/tariffs_page.dart';
// import '../pages/tariffs_page/tariffs_page_model.dart';
// import '../pages/user_menu_page/user_menu_page.dart';
// import '../pages/user_menu_page/user_menu_page_model.dart';
// import 'main_navigation_route_names.dart';

// class MainNavigation implements MyAppNavigation {
//   @override
//   Map<String, Widget Function(BuildContext)> get routes => {
//         MainNavigationRouteNames.authRoute: (_) => makeLoginPage(),
//         MainNavigationRouteNames.homeRoute: (_) => makeHomePage(),
//         MainNavigationRouteNames.servicesRoute: (_) => makeServicesPage(),
//         MainNavigationRouteNames.tabsRoute: (_) => makeTabsPage(),
//         MainNavigationRouteNames.tariffsRoute: (context) => makeTariffsPage(context),
//         MainNavigationRouteNames.myTariffsRoute: (_) => makeMyTariffsPage(_),
//         MainNavigationRouteNames.userMenuRoute: (_) => makeUserMenuPage(),
//       };

//   Widget makeLoginPage() {
//     return ChangeNotifierProvider(
//         create: (context) => LoginPageViewModel(
//               authService: context.read<InitializeProvider>().authService,
//             ),
//         child: const LoginPage());
//   }

//   Widget makeUserMenuPage() {
//     return ChangeNotifierProvider(
//         create: (context) => UserMenuPageModel(
//               settings: context.read<InitializeProvider>().settings,
//               authService: context.read<InitializeProvider>().authService,
//               cashedDataRepository: context.read<InitializeProvider>().cashedDataRepository,
//             ),
//         child: const UserMenuPage());
//   }

//   Widget makeHomePage() {
//     return ChangeNotifierProvider(
//       create: (context) => HomePageViewModel(
//         authService: context.read<InitializeProvider>().authService,
//         settings: context.read<InitializeProvider>().settings,
//         userDataService: context.read<InitializeProvider>().userDataService,
//         userServicesService: context.read<InitializeProvider>().userServicesService,
//         cashedDataRepository: context.read<InitializeProvider>().cashedDataRepository,
//       ),
//       child: const HomePage(),
//     );
//   }

//   Widget makeServicesPage() {
//     return ChangeNotifierProvider(
//       create: (context) => ServicesPageViewModel(
//         cashedDataRepository: context.read<InitializeProvider>().cashedDataRepository,
//         userServicesService: context.read<InitializeProvider>().userServicesService,
//       ),
//       child: const ServicesPage(),
//     );
//   }

//   Widget makeTabsPage() {
//     return ChangeNotifierProvider(
//       create: (_) => TabsPageViewModel(),
//       child: TabsPage(
//         screens: [makeHomePage()],
//       ),
//     );
//   }

//   Widget makeTariffsPage(BuildContext context) {
//     final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     return ChangeNotifierProvider(
//       create: (_) => TariffsPageViewModel(
//           cashedDataRepository: context.read<InitializeProvider>().cashedDataRepository, service: arguments['service']),
//       child: const TariffsPage(),
//     );
//   }

//   Widget makeMyTariffsPage(BuildContext context) {
//     final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     return ChangeNotifierProvider(
//       create: (_) => MyTariffsPageViewModel(
//         cashedDataRepository: context.read<InitializeProvider>().cashedDataRepository,
//         index: arguments['index'],
//       ),
//       child: const MyTariffsPage(),
//     );
//   }
// }
