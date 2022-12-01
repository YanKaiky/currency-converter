import 'package:converter/app/services/currency.service.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<CurrencyService> currencies = [];

  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyService toCoin;
  late CurrencyService fromCoin;

  HomeController({
    required this.toText,
    required this.fromText,
  }) {
    currencies = CurrencyService.getCurrencies();
    toCoin = currencies[0];
    fromCoin = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double total = 0;

    switch (fromCoin.name) {
      case 'Real':
        total = value * toCoin.real;
        break;
      case 'Dollar':
        total = value * toCoin.dollar;
        break;
      case 'Euro':
        total = value * toCoin.euro;
        break;
      case 'Libra':
        total = value * toCoin.libra;
        break;
      default:
    }

    fromText.text = total.toStringAsFixed(2);
  }
}
