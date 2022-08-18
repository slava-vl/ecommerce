import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  backgroundColor: Colors.transparent,
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (BuildContext context) {
                    final textStyle = Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, color: Theme.of(context).accentColor);
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 7)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24, left: 44, right: 20),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    width: 37,
                                    height: 37,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.close, color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const Alignment(0.3, 0),
                                    child: Text('Filter Options', style: textStyle),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    width: 86,
                                    height: 37,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text('Done',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 18, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 46, top: 20, right: 31),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Brand', style: textStyle),
                                Container(
                                  width: double.infinity,
                                  height: 37,
                                  margin: const EdgeInsets.only(top: 7, bottom: 14),
                                  padding: const EdgeInsets.only(left: 14),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownButton(
                                    underline: Container(),
                                    hint: Text('Samsung', style: TextStyle(color: Colors.black.withOpacity(0.4))),
                                    icon: const SizedBox(),
                                    items: ['Samsung', 'iPhone', 'Xiaomi', 'Honor'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                ),
                                Text('Price', style: textStyle),
                                Container(
                                  width: double.infinity,
                                  height: 37,
                                  margin: const EdgeInsets.only(top: 7, bottom: 14),
                                  padding: const EdgeInsets.only(left: 14),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownButton(
                                    underline: Container(),
                                    hint: Text('\$300 - \$500', style: TextStyle(color: Colors.black.withOpacity(0.4))),
                                    icon: const SizedBox(),
                                    items: ['\$100 - \$300', '\$300 - \$500', '\$500 - \$800', '\$800 - \$1000']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                ),
                                Text('Size', style: textStyle),
                                Container(
                                  width: double.infinity,
                                  height: 37,
                                  margin: const EdgeInsets.only(top: 7, bottom: 14),
                                  padding: const EdgeInsets.only(left: 14),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownButton(
                                    underline: Container(),
                                    hint: Text('4.5 to 5.5 inches',
                                        style: TextStyle(color: Colors.black.withOpacity(0.4))),
                                    icon: const SizedBox(),
                                    items: ['4.0 to 4.5 inches', '4.5 to 5.5 inches', '5.5 to 6.0 inches']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            child: SvgPicture.asset('assets/filter.svg'))
      ],
    );
  }
}
