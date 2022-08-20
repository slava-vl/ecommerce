import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Text(
        'My Cart',
        style: theme.textTheme.bodyLarge!.copyWith(color: theme.accentColor, fontSize: 35),
      ),
    );
  }
}
