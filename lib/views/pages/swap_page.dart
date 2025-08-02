import 'package:flutter/material.dart';
import 'package:phantom_clone/data/provider/crypto_provider.dart';
import 'package:phantom_clone/views/widgets/crypto_card_widget.dart';
import 'package:phantom_clone/views/widgets/navbar_widget.dart';
import 'package:phantom_clone/views/widgets/swap_card_widget.dart';
import 'package:provider/provider.dart';

class SwapPage extends StatelessWidget {
  const SwapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swap'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.list_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future:
                Provider.of<CryptoProvider>(
                  context,
                  listen: false,
                ).fetchCryptos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              final cryptoData = Provider.of<CryptoProvider>(context);
              final cryptos = cryptoData.cryptos;

              return Column(
                children: [
                  SwapCardWidget(label: 'You Pay', coin: cryptos[0]),
                  Icon(
                    Icons.swap_horizontal_circle_sharp,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                  SwapCardWidget(label: 'You Receive', coin: cryptos[3]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tokens',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final coin = cryptos[index];
                      return CryptoCardWidget(coin: coin);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
