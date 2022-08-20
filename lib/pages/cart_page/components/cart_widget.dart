import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_page_model.dart';
import 'cart_items_list.dart';
import 'checkout_button.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 12);
    final divider = Divider(color: Colors.white.withOpacity(0.5));
    final theme = Theme.of(context);
    final cart = context.watch<CartPageViewModel>().cart;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 60, left: 25, right: 30),
        decoration: BoxDecoration(
          color: theme.accentColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const CartItemsList(),
            divider,
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: theme.textTheme.bodySmall!.copyWith(color: Colors.white, fontSize: 15),
                ),
                Text(
                  '\$${cart.total} us',
                  style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white, fontSize: 15),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  style: theme.textTheme.bodySmall!.copyWith(color: Colors.white, fontSize: 15),
                ),
                Text(
                  cart.delivery,
                  style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white, fontSize: 15),
                )
              ],
            ),
            sizedBox,
            divider,
            const CheckoutButton(),
          ],
        ),
      ),
    );
  }
}
