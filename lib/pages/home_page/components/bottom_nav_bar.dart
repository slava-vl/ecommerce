import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Icon(Icons.circle, color: Colors.white, size: 8),
              const SizedBox(width: 7),
              Text(
                'Explorer',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15, color: Colors.white),
              )
            ],
          ),
          SvgPicture.asset('assets/shop.svg', color: Colors.white),
          SvgPicture.asset('assets/unlike.svg', color: Colors.white),
          SvgPicture.asset('assets/profile.svg', color: Colors.white),
        ],
      ),
    );
  }
}
