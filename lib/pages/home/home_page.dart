import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_nubank_interface/pages/home/widgets/item_menu_bottom.dart';
import 'package:flutter_nubank_interface/pages/home/widgets/menu_app.dart';
import 'package:flutter_nubank_interface/pages/home/widgets/my_app_bart.dart';
import 'package:flutter_nubank_interface/pages/home/widgets/my_dots_app.dart';
import 'package:flutter_nubank_interface/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double positionBottomLimit = _screenHeight * .80;
    double positionTopLimit = _screenHeight * .16;

    if (_yPosition == null) {
      _yPosition = _screenHeight * .16;
    }

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition = _showMenu ? positionBottomLimit : positionTopLimit;
              });
            },
          ),
          MenuApp(
            top: positionTopLimit,
            showMenu: _showMenu,
          ),
          PageViewApp(
            top: _yPosition,
            showMenu: _showMenu,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double middlePosition =
                  (positionBottomLimit - positionTopLimit) / 2;

              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition > positionTopLimit + middlePosition - 100
                          ? positionBottomLimit
                          : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition = _yPosition < positionBottomLimit - middlePosition
                      ? positionTopLimit
                      : _yPosition;
                }

                if (_yPosition == positionBottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDotsApp(
            top: _screenHeight * .66,
            currentIndex: _currentIndex,
            showMenu: _showMenu,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 150),
            bottom: !_showMenu ? 20 : 0,
            left: 0,
            right: 0,
            height: _screenHeight * 0.14,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 150),
              opacity: !_showMenu ? 1 : 0,
              child: Container(
                  child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  ItemMenuBottom(
                      icon: Icons.person_add, text: "Indicar amigos"),
                  ItemMenuBottom(
                      icon: Icons.phone_android, text: "Recarga de celular"),
                  ItemMenuBottom(icon: Icons.chat, text: "Cobrar"),
                  ItemMenuBottom(
                      icon: Icons.monetization_on, text: "Empréstimo"),
                  ItemMenuBottom(icon: Icons.move_to_inbox, text: "Depositar"),
                  ItemMenuBottom(
                      icon: Icons.mobile_screen_share, text: "Transferir"),
                  ItemMenuBottom(
                      icon: Icons.format_align_center, text: "Ajustar limite"),
                  ItemMenuBottom(icon: Icons.chrome_reader_mode, text: "Pagar"),
                  ItemMenuBottom(
                      icon: Icons.lock_open, text: "Bloquear cartão"),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
