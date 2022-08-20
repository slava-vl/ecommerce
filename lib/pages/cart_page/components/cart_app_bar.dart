import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartPageAppBar({Key? key}) : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 46),
        child: Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Add address',
                style: TextStyle(color: theme.accentColor, fontSize: 15),
              ),
            ),
            Container(
              width: 37,
              height: 37,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset('assets/location.svg', color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
