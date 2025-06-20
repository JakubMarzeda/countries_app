import 'package:flutter/material.dart';
import 'package:countries/models/country.dart';
import 'package:countries/screens/country_detail_screen.dart';
import 'package:countries/utils/format_population.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(country.flagUrl)),
        title: Text(country.name),
        subtitle: Text(
          "Ludność: ${formatNumberWithSpaces(country.population.toString())}",
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryDetailScreen(country: country),
            ),
          );
        },
      ),
    );
  }
}
