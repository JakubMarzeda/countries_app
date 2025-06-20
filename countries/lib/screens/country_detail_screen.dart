import 'package:flutter/material.dart';
import 'package:countries/models/country.dart';
import 'package:countries/utils/format_population.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;
  const CountryDetailScreen({super.key, required this.country});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ClipOval(
                child: Image.network(
                  country.flagUrl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 24),

              Text(
                country.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                "Population: ${formatNumberWithSpaces(country.population.toString())}",
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 12),

              Text(
                "Capital city: ${country.capital.join(", ")}",
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 12),

              Text(
                "Region: ${(country.region)}",
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: const Text("Powrót"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
