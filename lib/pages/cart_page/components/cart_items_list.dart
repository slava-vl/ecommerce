import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../cart_page_model.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cart = context.watch<CartPageViewModel>().cart;
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: cart.basket.length,
        itemBuilder: (context, index) => Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 90,
                width: 90,
                color: Colors.white,
                child: Image.network(
                  cart.basket[index].images,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.basket[index].title,
                    style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$${cart.basket[index].price}',
                    style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor, fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              child: Column(
                children: [
                  Text(
                    '-',
                    style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    '2',
                    style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    '+',
                    style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/delete.svg',
              color: Colors.white.withOpacity(0.2),
            ),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 45),
      ),
    );
  }
}
