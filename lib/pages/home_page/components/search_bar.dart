import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(children: [
      const SizedBox(width: 32),
      Expanded(
        child: Container(
          height: 34,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 7)],
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              SvgPicture.asset(
                'assets/search.svg',
                color: theme.primaryColor,
              ),
              const SizedBox(width: 25),
              Text(
                'Search',
                style: theme.textTheme.bodySmall!.copyWith(fontSize: 12),
              )
            ],
          ),
        ),
      ),
      const SizedBox(width: 11),
      Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 7)],
        ),
        child: Center(child: SvgPicture.asset('assets/qr.svg', color: Colors.white)),
      ),
      const SizedBox(width: 37),
    ]);
  }
}
