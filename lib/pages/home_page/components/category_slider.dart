import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/product_category.dart';
import '../home_page_model.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = context.read<HomePageViewModel>().categories;
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 17),
            Text('Select Category', style: theme.textTheme.bodyLarge!.copyWith(fontSize: 25)),
            const Spacer(),
            Text('view all', style: theme.textTheme.bodySmall!.copyWith(color: theme.primaryColor, fontSize: 14)),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 10),
            children: categories.map((e) => _CategoryCard(e)).toList(),
          ),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final ProductCategory category;
  const _CategoryCard(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedCategoryId = context.select((HomePageViewModel model) => model.selectedCategoryId);
    final isSelected = selectedCategoryId == category.id;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.read<HomePageViewModel>().changeSelectedCategoryId(category.id),
      child: Column(children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: isSelected ? theme.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 7)],
          ),
          child: Center(
            child: SvgPicture.asset(
              category.ico,
              color: isSelected ? Colors.white : Colors.black.withOpacity(0.2),
              width: 30,
              height: 30,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          category.title,
          style:
              theme.textTheme.bodyMedium!.copyWith(fontSize: 12, color: isSelected ? theme.primaryColor : Colors.black),
        ),
      ]),
    );
  }
}
