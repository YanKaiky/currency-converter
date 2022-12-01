// ignore_for_file: must_be_immutable

import 'package:converter/app/components/drop.currency.dart';
import 'package:converter/app/controllers/home.controller.dart';
import 'package:converter/app/services/currency.service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100,
              right: 30,
              bottom: 20,
              left: 30,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Fintellis.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 60),
                DropCurrency(
                  enabled: true,
                  selected: homeController.toCoin,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: ((val) {
                    setState(() {
                      homeController.toCoin = val as CurrencyService;
                    });
                  }),
                ),
                const SizedBox(height: 30),
                DropCurrency(
                  enabled: false,
                  selected: homeController.fromCoin,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: ((val) {
                    setState(() {
                      homeController.fromCoin = val as CurrencyService;
                    });
                  }),
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    homeController.convert();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Converter',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
