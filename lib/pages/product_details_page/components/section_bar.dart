import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../product_details_page_model.dart';

class SectionBar extends StatelessWidget {
  const SectionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<ProductDetailsPageViewModel>(
      builder: (context, sectionBarService, child) {
        final sectionBarItems = sectionBarService.sectionBarItems;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                sectionBarItems.length,
                (index) {
                  return GestureDetector(
                    onTap: () => sectionBarService.changeSelectedSection(index),
                    child: Column(
                      children: [
                        Text(
                          sectionBarItems[index],
                          style: (index == sectionBarService.selectedSectionBarItem
                                  ? theme.textTheme.bodyLarge!
                                  : theme.textTheme.bodySmall!)
                              .copyWith(
                                  color: index == sectionBarService.selectedSectionBarItem
                                      ? theme.accentColor
                                      : Colors.black.withOpacity(0.2),
                                  fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          height: 5,
                          decoration: BoxDecoration(
                            color: index == sectionBarService.selectedSectionBarItem
                                ? theme.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
