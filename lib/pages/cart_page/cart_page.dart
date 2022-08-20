import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page_model.dart';
import 'components/cart_app_bar.dart';
import 'components/cart_widget.dart';
import 'components/header_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((CartPageViewModel model) => model.isLoading);
    return Scaffold(
      appBar: const CartPageAppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HeaderText(),
                CartWidget(),
              ],
            ),
    );
  }
}
