import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/hot_product.dart';
import '../../product_details_page/product_details_page.dart';
import '../home_page_model.dart';

class HotSalesSlider extends StatelessWidget {
  const HotSalesSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hotProducts = context.read<HomePageViewModel>().data.hotProducts;
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 17),
            Text('Hot sales', style: theme.textTheme.bodyLarge!.copyWith(fontSize: 25)),
            const Spacer(),
            Text('see more', style: theme.textTheme.bodySmall!.copyWith(color: theme.primaryColor, fontSize: 14)),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 21),
          child: SizedBox(
            height: 180,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PageView(
                children: hotProducts.map((e) => _HotProductCard(hotProduct: e)).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HotProductCard extends StatelessWidget {
  const _HotProductCard({Key? key, required this.hotProduct}) : super(key: key);

  final HotProduct hotProduct;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 7)],
          ),
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            hotProduct.picture,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 14,
          left: 25,
          bottom: 26,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (hotProduct.isNew) ...[
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(child: Text('NEW', style: TextStyle(fontSize: 11, color: Colors.white))),
                ),
                const SizedBox(height: 20)
              ],
              DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 20)],
                ),
                child: Column(
                  children: [
                    Text(hotProduct.title,
                        style: theme.textTheme.bodyLarge!.copyWith(fontSize: 25, color: Colors.white)),
                  ],
                ),
              ),
              Text(hotProduct.subtitle, style: theme.textTheme.bodySmall!.copyWith(fontSize: 11, color: Colors.white)),
              const Spacer(),
              if (hotProduct.isBuy)
                SizedBox(
                  width: 98,
                  height: 23,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsPage.create())),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Buy now!',
                        style: theme.textTheme.bodyLarge!.copyWith(fontSize: 11, color: Colors.black),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
