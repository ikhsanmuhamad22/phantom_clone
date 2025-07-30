import 'package:flutter/material.dart';
import 'package:phantom_clone/data/classes/crypto_class.dart';
import 'package:phantom_clone/views/pages/crypto_detail_page.dart';

class CryptoCardWidget extends StatelessWidget {
  const CryptoCardWidget({super.key, required this.coin});

  final Crypto coin;

  @override
  Widget build(BuildContext context) {
    var isPlus = coin.percentChange24h;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CryptoDetailPage(coin: coin);
            },
          ),
        );
      },
      child: Card(
        child: SizedBox(
          height: 80,
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Icon(Icons.currency_bitcoin, color: Colors.deepPurple),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(coin.name, style: TextStyle(fontSize: 16)),
                    Text(
                      '0.0 ${coin.symbol}',
                      style: TextStyle(fontSize: 14, color: Colors.white54),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${formatNumber(coin.priceUsd)}',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '${coin.percentChange24h}',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              isPlus.isNegative
                                  ? Colors.red
                                  : Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
