class Country {
  final String name;
  final String flagUrl;
  final String region;
  final List<String> capital;
  final int population;

  Country({
    required this.name,
    required this.flagUrl,
    required this.region,
    required this.capital,
    required this.population,
  });
}

Country countryFromJson(Map<String, dynamic> json) {
  return Country(
    name: json["name"]["common"] ?? "Unknown",
    flagUrl: json["flags"]["png"] ?? "",
    region: json["region"] ?? "Unknown",
    capital: List<String>.from(json["capital"] ?? []),
    population: json["population"] ?? 0,
  );
}
