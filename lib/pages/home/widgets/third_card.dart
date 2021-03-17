import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThirdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icons/gift-outline.svg',
            color: Colors.grey,
            semanticsLabel: 'gift',
          ),
          Column(
            children: [
              Text(
                'Nubank Rewards',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              SizedBox(height: 15),
              Text(
                'Acumule pontos que nunca expiram e troque por passagens aéreas ou serviços que você realmente usa.',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 0.7, color: Colors.purple[800]),
            ),
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.purple[800]),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'ATIVE O SEU REWARDS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
