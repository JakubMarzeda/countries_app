class Country {
  String name;
  String flagUrl;
  String region;
  List<String> capital; // Niektóre państwa mogą mieć więcej niż jedną stolicę np. RPA
  int population;
  Country(this.name, this.flagUrl, this.region, this.capital, this.population);
}
