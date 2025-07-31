import 'package:flutter/material.dart';
import 'package:phantom_clone/data/classes/crypto_class.dart';
import 'package:phantom_clone/views/widgets/card_widget.dart';
import 'package:phantom_clone/views/widgets/crypto_card_widget.dart';
import 'package:phantom_clone/views/widgets/crypto_chart_widget.dart';
import 'package:phantom_clone/views/widgets/navbar_widget.dart';
import 'package:phantom_clone/views/widgets/price_pnl_widget.dart';

class CryptoDetailPage extends StatelessWidget {
  const CryptoDetailPage({super.key, required this.coin});

  final Crypto coin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 80,

        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black45,
              radius: 16,
              child: Icon(
                Icons.currency_bitcoin,
                color: Colors.deepPurple,
                size: 18,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  coin.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                Text(
                  coin.symbol,
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              PricePnlWidget(coin: coin),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AspectRatio(
                  aspectRatio: 1.7,
                  child: CryptoChartWidget(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardWidget(icon: Icons.qr_code, label: 'Reveice'),
                    CardWidget(icon: Icons.send, label: 'Send'),
                    CardWidget(icon: Icons.attach_money, label: 'Buy'),
                    CardWidget(icon: Icons.more_horiz, label: 'More'),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your balance',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white38,
                      ),
                    ),
                    CryptoCardWidget(coin: coin),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '24h Performance',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white38,
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          _buildRow('volume', formatNumber(coin.volume24)),
                          _buildRow(
                            '24 change',
                            coin.percentChange24h.toStringAsFixed(2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Info',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white38,
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          _buildRow('Name', coin.name),
                          _buildRow('Symbol', coin.symbol),
                          _buildRow('Network', coin.name),
                          _buildRow(
                            'Market Cap',
                            formatNumber(coin.marketCapUsd),
                          ),
                          _buildRow(
                            'Total Supply',
                            coin.msupply.isEmpty
                                ? 'Null'
                                : formatNumber(double.parse(coin.msupply)),
                          ),
                          _buildRow(
                            'Circulating Supply',
                            formatNumber(coin.csupply),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 30,
                  left: 5,
                  right: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white38,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'A cryptocurrency is a digital or virtual currency secured by cryptography, which makes it nearly impossible to counterfeit or double-spend. Most cryptocurrencies exist on decentralized networks using blockchain technology—a distributed ledger enforced by a disparate network of computers.',
                      style: TextStyle(color: Colors.white38),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'A defining feature of cryptocurrencies is that they are generally not issued by any central authority, rendering them theoretically immune to government interference or manipulation.',
                      style: TextStyle(color: Colors.white38),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        color: Colors.black26,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(style: TextStyle(color: Colors.black), 'Buy'),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(style: TextStyle(color: Colors.black), 'Sell'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
