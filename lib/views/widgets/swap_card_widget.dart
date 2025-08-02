import 'package:flutter/material.dart';
import 'package:phantom_clone/data/classes/crypto_class.dart';

class SwapCardWidget extends StatelessWidget {
  const SwapCardWidget({super.key, required this.label, required this.coin});

  final Crypto coin;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14, color: Colors.white54),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0',
                    style: TextStyle(fontSize: 26, color: Colors.white54),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        child: Card(
                          color: Colors.white10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 14,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  child: Icon(Icons.currency_bitcoin),
                                ),
                                SizedBox(width: 5),
                                Text(coin.symbol),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_drop_down, size: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '0.0 ${coin.symbol}',
                        style: TextStyle(fontSize: 14, color: Colors.white54),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
