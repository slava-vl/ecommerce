import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../tabs_page_model.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barItems = context.read<TabsPageViewModel>().navBarItems;
    final selectedItemIndex = context.select((TabsPageViewModel model) => model.selectedNavBarIndex);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      color: selectedItemIndex == 1 ? theme.accentColor : theme.scaffoldBackgroundColor,
      child: Container(
        width: double.infinity,
        height: 72,
        decoration: BoxDecoration(
          color: theme.accentColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: barItems
              .map((e) => AnimatedCrossFade(
                    firstChild: Text(
                      '• ${e.title}',
                      style: theme.textTheme.bodyLarge!.copyWith(fontSize: 15, color: Colors.white),
                    ),
                    secondChild: InkWell(
                      onTap: () => context.read<TabsPageViewModel>().changeSelectedNavBarIndex(e.id),
                      child: SvgPicture.asset(
                        e.ico,
                        color: Colors.white,
                        width: 18,
                        height: 18,
                      ),
                    ),
                    crossFadeState: selectedItemIndex == e.id ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
