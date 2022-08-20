import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../product_details_page_model.dart';

class ShopInfo extends StatelessWidget {
  const ShopInfo({Key? key}) : super(key: key);

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse('0x$hexColor'));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final info = context.read<ProductDetailsPageViewModel>().data;
    final selectedColor = context.select((ProductDetailsPageViewModel model) => model.selectedColor);
    final selectedCapacity = context.select((ProductDetailsPageViewModel model) => model.selectedCapacity);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _PropertyWidget(ico: 'assets/cpu.svg', title: info.cpu),
            _PropertyWidget(ico: 'assets/camera.svg', title: info.camera),
            _PropertyWidget(ico: 'assets/ram.svg', title: info.sd),
            _PropertyWidget(ico: 'assets/ssd.svg', title: info.ssd),
          ],
        ),
        const SizedBox(height: 25),
        Text(
          'Select color and capacity',
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            color: theme.accentColor,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            ...info.color
                .map((e) => InkWell(
                      onTap: () => context.read<ProductDetailsPageViewModel>().changeSelectedColor(getColorFromHex(e)),
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(right: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: getColorFromHex(e),
                        ),
                        child: selectedColor == getColorFromHex(e)
                            ? const Icon(Icons.done, color: Colors.white)
                            : const SizedBox.shrink(),
                      ),
                    ))
                .toList(),
            const Spacer(),
            ...info.capacity
                .map(
                  (e) => InkWell(
                    onTap: () => context.read<ProductDetailsPageViewModel>().changeSelectedCapacity(e),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: 30,
                      margin: const EdgeInsets.only(right: 18),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: selectedCapacity == e ? theme.primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        e,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 13,
                          color: selectedCapacity == e ? Colors.white : Colors.black.withOpacity(0.2),
                        ),
                      )),
                    ),
                  ),
                )
                .toList(),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 27),
        ElevatedButton(
          onPressed: selectedColor == null || selectedCapacity == null ? null : () {},
          style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Add to Cart',
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 20, color: Colors.white),
              ),
              Text(
                '\$${info.price}',
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PropertyWidget extends StatelessWidget {
  const _PropertyWidget({Key? key, required this.ico, required this.title}) : super(key: key);
  final String ico;
  final String title;

  @override
  Widget build(BuildContext context) {
    final color = Colors.black.withOpacity(0.2);
    return Column(children: [
      SvgPicture.asset(ico, color: color),
      const SizedBox(height: 5),
      Text(title, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11, color: color)),
    ]);
  }
}
