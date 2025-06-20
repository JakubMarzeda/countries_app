import 'package:countries/models/country.dart';
import 'package:flutter/material.dart';
import 'package:countries/widgets/country_card.dart';
import 'package:countries/services/api_service.dart';
import 'package:countries/widgets/search_bar.dart' as custom_widgets;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    fetchCountries().then((countries) {
      setState(() {
        _allCountries = countries;
        _filteredCountries = countries;
      });
    });
  }

  void _filterCountries(String query) {
    final filtered =
        _allCountries.where((country) {
          return country.name.toLowerCase().contains(query.toLowerCase());
        }).toList();

    setState(() {
      _filteredCountries = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text("Countries", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          custom_widgets.SearchBar(
            controller: _searchController,
            onChanged: _filterCountries,
          ),
          Expanded(
            child:
                _allCountries.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : _filteredCountries.isEmpty
                    ? const Center(child: Text('No matching countries'))
                    : ListView.builder(
                      itemCount: _filteredCountries.length,
                      itemBuilder: (context, index) {
                        return CountryCard(country: _filteredCountries[index]);
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
