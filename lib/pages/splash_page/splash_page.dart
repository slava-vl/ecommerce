import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/main_navigation_route_names.dart';
import '../home_page/home_page_model.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Future.wait([context.read<HomePageViewModel>().init()])
        .then((_) => Navigator.pushReplacementNamed(context, MainNavigationRouteNames.tabsRoute));
    final textStyle = theme.textTheme.headlineLarge!.copyWith(color: Colors.white, fontSize: 30);
    return Stack(
      children: [
        Container(color: theme.accentColor),
        Align(
          alignment: const Alignment(-0.2, 0),
          child: Container(
            width: 132,
            height: 132,
            decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Align(
          alignment: const Alignment(0.2, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ecommerce', style: textStyle),
              Text('Concept', style: textStyle),
            ],
          ),
        )
      ],
    );
  }
}
