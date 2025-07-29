import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phantom_clone/data/classes/crypto_class.dart';

class CryptoProvider with ChangeNotifier {
  List<Crypto> _cryptos = [];

  List<Crypto> get cryptos => _cryptos;

  Future<void> fetchCryptos() async {
    final url = Uri.parse(
      'https://api.coinlore.net/api/tickers/?start=0&limit=10',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> coins = data['data'];

      _cryptos = coins.map((coin) => Crypto.fromJson(coin)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load crypto data');
    }
  }
}
