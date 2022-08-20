import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../product_details_page_model.dart';
import 'product_info_shop.dart';
import 'section_bar.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final info = context.watch<ProductDetailsPageViewModel>().data;
    final selectedSectionBarItem = context.select((ProductDetailsPageViewModel model) => model.selectedSectionBarItem);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  info.title,
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 24),
                ),
                InkWell(
                  onTap: () => context.read<ProductDetailsPageViewModel>().toggleLikeMode(),
                  child: Container(
                    width: 37,
                    height: 33,
                    decoration: BoxDecoration(
                      color: info.isFavorites ? theme.primaryColor : theme.accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        info.isFavorites ? 'assets/like.svg' : 'assets/unlike.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7.0),
            child: RatingBar.builder(
              initialRating: info.rating,
              minRating: 1,
              allowHalfRating: true,
              glow: false,
              itemSize: 25,
              unratedColor: Colors.amber.withOpacity(0.2),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 10,
              ),
              onRatingUpdate: (_) {},
            ),
          ),
          const SizedBox(height: 30),
          const SectionBar(),
          const SizedBox(height: 20),
          AnimatedCrossFade(
            firstChild: const ShopInfo(),
            secondChild: AnimatedCrossFade(
              firstChild: const Text('Details'),
              secondChild: const Text('Features'),
              crossFadeState: selectedSectionBarItem == 1 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
            ),
            crossFadeState: selectedSectionBarItem == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
