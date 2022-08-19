import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'modal_bottom_sheet.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        height: 19,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/location.svg', color: Theme.of(context).primaryColor),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Zihuatanejo, Gro',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.grey,
              size: 15,
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => showModalBottomSheet<void>(
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (BuildContext context) => const ModalBottomFilter(),
                ),
            child: SvgPicture.asset('assets/filter.svg'))
      ],
    );
  }
}
