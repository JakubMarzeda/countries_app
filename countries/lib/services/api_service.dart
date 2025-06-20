// link do API -->> https://restcountries.com/v3.1/all?fields=name,flags,region,capital,population
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:countries/models/country.dart';

Future<List<Country>> fetchCountries() async {
  final response = await http.get(
    Uri.parse(
      "https://restcountries.com/v3.1/all?fields=name,flags,region,capital,population",
    ),
  );
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => countryFromJson(json)).toList();
  } else {
    throw Exception("Failed load countries");
  }
}
