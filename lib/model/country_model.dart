
// class Country {
//   Map<String, dynamic>? flag;
//   String? name;
//   String? capital;
//   List<dynamic>? callingCode;
//   String? region;
//   String? subRegion;
//   double? area;
//   String? language;
//   String? timeZone;
//   int? population;
//   bool? independent;
//   List<dynamic>? currency;
//
//   Country({
//     this.flag,
//     this.name,
//     this.capital,
//     this.region,
//     this.callingCode,
//     this.subRegion,
//     this.language,
//     this.timeZone,
//     this.area,
//     this.population,
//     this.independent,
//     this.currency
// });
//
//   factory Country.fromJson(Map<String, dynamic> json) {
//     return Country(
//       flag: json['flags'],
//       name: json['name'],
//       capital: json['capital'] ?? 'Unknown',
//       callingCode: json['callingCodes'] ?? 'Unknown',
//       region: json['region'] ?? 'Unknown',
//       subRegion: json['subregion'] ?? 'Unknown',
//       language: json['languages'][0]['name'] ?? 'Unknown',
//       timeZone: json['timezones'][0] ?? 'Unknown',
//       area: json['area'] ?? 0,
//       population: json['population'] ?? 'Unknown',
//       independent: json['independent'],
//       currency: json['currencies']
//     );
//   }
// }

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
    this.independence
});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      flag: json['flags']['png'],
      coatOfArm: json['coatOfArms']['png'],
      name: json['name']['official'] ?? 'Unknown',
      capital: json['capital'] ?? <dynamic>['Unknown'],
      population: json['population'] ?? 0,
      language: json['languages'],
      area: json['area'] ?? 0,
      region: json['region'] ?? 'Unknown',
      subregion: json['subregion'] ?? 'Unknown',
      drivingSide: json['car']['side'] ?? 'Unknown',
      timeZone: json['timezones'] ?? <dynamic>['Unknown'],
      callingCodeRoot: json['idd']['root'],
      callingCodeSuffix: json['idd']['suffixes'] ?? <dynamic>['Unknown'],
      currency: json['currencies'],
      independence: json['independent']
    );
  }
}