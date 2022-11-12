class Country {
  dynamic flag;
  dynamic coatOfArm;
  String? name;
  List<dynamic>? capital;
  List<dynamic>? timeZone;
  int? population;
  Map<String, dynamic>? language;
  double? area;
  String? region;
  String? subregion;
  String? drivingSide;
  dynamic callingCodeRoot;
  List<dynamic>? callingCodeSuffix;
  Map<String,dynamic>? currency;
  bool? independence;
  dynamic continent;

  Country({
    this.flag,
    this.coatOfArm,
    this.name,
    this.capital,
    this.population,
    this.language,
    this.area,
    this.region,
    this.subregion,
    this.drivingSide,
    this.callingCodeRoot,
    this.callingCodeSuffix,
    this.timeZone,
    this.currency,
    this.independence,
    this.continent
});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      flag: json['flags']['png'],
      coatOfArm: json['coatOfArms']['png'],
      name: json['name']['official'] ?? 'Unknown',
      capital: json['capital'] ?? <dynamic>['Unknown'],
      population: json['population'] ?? 0,
      language: json['languages'] ?? unknown,
      area: json['area'] ?? 0,
      region: json['region'] ?? 'Unknown',
      subregion: json['subregion'] ?? 'Unknown',
      drivingSide: json['car']['side'] ?? 'Unknown',
      timeZone: json['timezones'] ?? <dynamic>['Unknown'],
      callingCodeRoot: json['idd']['root'] ?? '',
      callingCodeSuffix: json['idd']['suffixes'] ?? <dynamic>['Unknown'],
      currency: json['currencies'] ?? unknownCurrency,
      independence: json['independent'],
      continent: json['continents'][0] ?? 'Unknown'
    );
  }
}

Map<String, dynamic> unknown = {
  'name': 'Unknown'
};

Map<String, dynamic> unknownCurrency = {
  'unknown': unknown
};


