import 'package:flutter/material.dart';
import 'package:phantom_clone/data/classes/crypto_class.dart';

class PricePnlWidget extends StatelessWidget {
  const PricePnlWidget({super.key, this.coin});

  final Crypto? coin;

  @override
  Widget build(BuildContext context) {
    var isPlus = coin?.percentChange24h;

    return Column(
      children: [
        Text(
          coin?.priceUsd == null || coin!.priceUsd == 0
              ? '\$184.99'
              : '\$${formatNumber(coin!.priceUsd)}',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (coin == null)
              Text(
                coin?.percentChange24h == null || coin!.percentChange24h == 0
                    ? '- \$0.31'
                    : '\$${coin?.percentChange24h.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                ),
              ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color:
                    isPlus?.isNegative == false
                        ? const Color.fromARGB(255, 27, 58, 43)
                        : const Color.fromARGB(255, 86, 38, 38),
                borderRadius: BorderRadius.circular(5), // Rounded corners
              ),
              child: Text(
                coin?.percentChange24h == null || coin!.percentChange24h == 0
                    ? '-0.31%'
                    : '${coin?.percentChange24h.toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color:
                      isPlus?.isNegative == false ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
