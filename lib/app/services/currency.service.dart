class CurrencyService {
  final String name;
  final double real;
  final double dollar;
  final double euro;
  final double libra;

  CurrencyService({
    required this.name,
    required this.real,
    required this.dollar,
    required this.euro,
    required this.libra,
  });

  static List<CurrencyService> getCurrencies() {
    return <CurrencyService>[
      CurrencyService(
        name: 'Real',
        real: 1.0,
        dollar: 0.19,
        euro: 0.18,
        libra: 0.16,
      ),
      CurrencyService(
        name: 'Dollar',
        real: 5.19,
        dollar: 1.0,
        euro: 0.97,
        libra: 0.84,
      ),
      CurrencyService(
        name: 'Euro',
        real: 5.45,
        dollar: 1.03,
        euro: 1.0,
        libra: 0.86,
      ),
      CurrencyService(
        name: 'Libra',
        real: 5.45,
        dollar: 1.20,
        euro: 1.16,
        libra: 1.0,
      ),
    ];
  }
}
