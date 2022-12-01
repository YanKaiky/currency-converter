import 'package:converter/app/controllers/home.controller.dart';
import 'package:converter/app/services/currency.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  List currencies = CurrencyService.getCurrencies();

  final homeController = HomeController(
      toCoin: currencies[0],
      fromCoin: currencies[1],
      toText: toText,
      fromText: fromText);

  test(
    'Deve converter de real para dólar',
    () {
      toText.text = '1.0';
      homeController.convert();
      expect(fromText.text, '0.36');
    },
  );

  test(
    'Deve converter de dólar para real',
    () {
      toText.text = '2.0';

      homeController.toCoin = CurrencyService(
        name: 'Dollar',
        real: 5.27,
        dollar: 1.0,
        euro: 0.97,
        libra: 0.84,
      );

      homeController.fromCoin = CurrencyService(
        name: 'Real',
        real: 1.0,
        dollar: 0.19,
        euro: 0.18,
        libra: 0.16,
      );

      homeController.convert();

      expect(fromText.text, '5.27');
    },
  );
}
