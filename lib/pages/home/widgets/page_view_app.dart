import 'package:flutter/material.dart';
import 'package:flutter_nubank_interface/pages/home/widgets/card_app.dart';
import 'package:flutter_nubank_interface/pages/home/widgets/first_card.dart';
import 'package:flutter_nubank_interface/pages/home/widgets/second_card.dart';
import 'package:flutter_nubank_interface/pages/home/widgets/third_card.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate;
  final bool showMenu;

  const PageViewApp(
      {Key key, this.top, this.onChanged, this.onPanUpdate, this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
      top: top,
      height: MediaQuery.of(context).size.height * 0.5,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
          onPageChanged: onChanged,
          physics: showMenu
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
          children: [
            CardApp(
              child: FirstCard(),
            ),
            CardApp(
              child: SecondCard(),
            ),
            CardApp(
              child: ThirdCard(),
            ),
          ],
        ),
      ),
    );
  }
}
