import 'package:flutter/material.dart';

class ItemMenuBottom extends StatelessWidget {
  final IconData icon;
  final String text;

  const ItemMenuBottom({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              Text(text, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white24,
        ),
      ),
    );
  }
}
