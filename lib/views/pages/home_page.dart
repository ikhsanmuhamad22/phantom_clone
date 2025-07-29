import 'package:flutter/material.dart';
import 'package:phantom_clone/data/provider/crypto_provider.dart';
import 'package:phantom_clone/views/widgets/card_info_widget.dart';
import 'package:phantom_clone/views/widgets/card_widget.dart';
import 'package:phantom_clone/views/widgets/crypto_card_widget.dart';
import 'package:phantom_clone/views/widgets/navbar_widget.dart';
import 'package:phantom_clone/views/widgets/price_pnl_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Icon(Icons.account_circle, size: 35),
            SizedBox(width: 8),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '@mikhsann',
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                ),
                Text(
                  'Account 1',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code_scanner_rounded),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                PricePnlWidget(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardWidget(icon: Icons.qr_code, label: 'Reveice'),
                      CardWidget(icon: Icons.send, label: 'Send'),
                      CardWidget(icon: Icons.repeat, label: 'Swap'),
                      CardWidget(icon: Icons.attach_money, label: 'Buy'),
                    ],
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CardInfoWidget(
                        icon: Icons.subject_rounded,
                        desc: 'Earn up to 9% APY by staking your SOL ',
                        close: true,
                      ),
                      CardInfoWidget(
                        icon: Icons.data_object_outlined,
                        desc:
                            'Get real-time updates on your crypto, NFTs, and more',
                        close: true,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Preps',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Manage',
                            style: TextStyle(color: Colors.deepPurpleAccent),
                          ),
                        ],
                      ),
                      CardInfoWidget(
                        icon: Icons.account_balance_wallet_sharp,
                        desc:
                            'Use perps to trade on an assets future price with laverage',
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tokens',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      FutureBuilder(
                        future:
                            Provider.of<CryptoProvider>(
                              context,
                              listen: false,
                            ).fetchCryptos(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          final cryptoData = Provider.of<CryptoProvider>(
                            context,
                          );
                          final cryptos = cryptoData.cryptos;

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cryptos.length,
                            itemBuilder: (context, index) {
                              final coin = cryptos[index];
                              return CryptoCardWidget(coin: coin);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: NavbarWidget(),
    );
  }
}
