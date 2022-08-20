import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../cart_page/cart_page_model.dart';
import '../tabs_page_model.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barItems = context.read<TabsPageViewModel>().navBarItems;
    final selectedItemIndex = context.select((TabsPageViewModel model) => model.selectedNavBarIndex);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        color: theme.accentColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(selectedItemIndex == 1 ? 0 : 40),
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
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: Center(
                            child: SvgPicture.asset(
                              e.ico,
                              color: Colors.white,
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ),
                        if (e.id == 1)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration:
                                  BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(20)),
                              child: context.select(
                                (CartPageViewModel model) => Center(
                                  child: Text(
                                    model.cart.basket.length.toString(),
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  crossFadeState: selectedItemIndex == e.id ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 200),
                ))
            .toList(),
      ),
    );
  }
}
