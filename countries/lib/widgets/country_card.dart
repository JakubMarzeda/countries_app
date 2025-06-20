import 'package:flutter/material.dart';
import 'package:countries/models/country.dart';

class CountryCardWidget extends StatelessWidget {
  final Country country;
  const CountryCardWidget({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(country.flagUrl)),
        title: Text(country.name),
        subtitle: Text("Ludność: ${country.population}"),
        onTap: () {
          // tutaj możesz otworzyć ekran szczegółów
        },
      ),
    );
  }
}
