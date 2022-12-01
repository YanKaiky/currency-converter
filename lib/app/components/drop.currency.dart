import 'package:converter/app/services/currency.service.dart';
import 'package:flutter/material.dart';

class DropCurrency extends StatelessWidget {
  final List<CurrencyService> items;
  final TextEditingController controller;
  final void Function(CurrencyService? model)? onChanged;

  final CurrencyService selected;
  final bool enabled;

  const DropCurrency({
    super.key,
    required this.items,
    required this.controller,
    required this.selected,
    required this.enabled,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          right: 15,
          bottom: 5,
          left: 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 56,
                child: DropdownButton<CurrencyService>(
                  iconEnabledColor: Colors.cyan,
                  isExpanded: true,
                  value: selected,
                  underline: Container(
                    height: 1,
                    color: Colors.cyan,
                  ),
                  items: items
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: onChanged,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
              height: 45,
              child: VerticalDivider(
                thickness: 1,
                width: 2,
                indent: 10,
                color: Colors.blueGrey,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                enabled: enabled,
                controller: controller,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
