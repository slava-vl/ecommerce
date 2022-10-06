import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_init.dart';
import 'components/carroussel.dart';
import 'components/details_app_bar.dart';
import 'components/product_info.dart';
import 'product_details_page_model.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailsPageViewModel(
          productDetailDataSrvice: context.read<InitializeProvider>().productDetailDataSrvice),
      child: const ProductDetailsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((ProductDetailsPageViewModel model) => model.isLoading);
    return Scaffold(
        appBar: const DetailsPageAppBar(),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: const [
                  Carroussel(),
                  ProductInfo(),
                ],
              ));
  }
}
