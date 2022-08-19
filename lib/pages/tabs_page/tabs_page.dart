import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page/home_page.dart';
import 'components/bottom_nav_bar.dart';
import 'tabs_page_model.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => TabsPageViewModel(),
      child: const TabsPage(),
    );
  }

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  late final PageController controller;
  @override
  void initState() {
    controller = context.read<TabsPageViewModel>().pageController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          HomePage(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
