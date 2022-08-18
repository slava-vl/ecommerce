import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/best_product.dart';
import '../home_page_model.dart';

class BestSellerGrid extends StatelessWidget {
  const BestSellerGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bestSellers = context.read<HomePageViewModel>().data.bestProducts;
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 17),
            Text('Best Seller', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25)),
            const Spacer(),
            Text('see more',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).primaryColor, fontSize: 14)),
            const SizedBox(width: 30),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
          child: StaggeredGrid.extent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 12,
            crossAxisSpacing: 11,
            children: bestSellers.map((e) => _BestProductCard(e)).toList(),
          ),
        )
      ],
    );
  }
}

class _BestProductCard extends StatelessWidget {
  final BestProduct bestProduct;
  const _BestProductCard(this.bestProduct, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 227,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 168,
                    child: Image.network(
                      bestProduct.picture,
                      errorBuilder: (context, error, stackTrace) => const Center(
                        child: Text("Picture isn't loaded("),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 11,
                    right: 12,
                    child: Container(
                      width: 25,
                      height: 25,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)],
                      ),
                      child: SvgPicture.asset(
                        bestProduct.isFavorites ? 'assets/like.svg' : 'assets/unlike.svg',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    '\$${bestProduct.priceWithoutDiscount}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    '\$${bestProduct.discountPrice}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 10, decoration: TextDecoration.lineThrough, color: Colors.black.withOpacity(0.3)),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                bestProduct.title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10, color: Colors.black),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}