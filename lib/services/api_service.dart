import 'dart:convert';
import 'package:country_app/model/country_model.dart';
import 'package:http/http.dart' as http;

// class ApiServices {
//   Future<List<Country>> fetchCountries() async {
//     List<Country> _countryList = [];
//     final response = await http.get(Uri.parse('https://restcountries.com/v2/all'));
//     if( response.statusCode == 200) {
//       List<dynamic> values = <dynamic>[];
//       values = json.decode(response.body);
//       if(values.isNotEmpty) {
//         for(int i = 0; i<values.length; i++) {
//           if(values[i] != null) {
//             Map<String, dynamic> map = values[i];
//             _countryList.add(Country.fromJson(map));
//           }
//         }
//       }
//       // print(_countryList[0].subRegion);
//       print(_countryList[0].flag!['png']);
//       // print(_countryList[8].callingCode);
//       // print(_countryList[0].region);
//       // print(_countryList[8].name);
//       // print(_countryList[8].capital);
//       // print(_countryList[0].language);
//       // print(_countryList[0].area);
//       // print(_countryList[0].timeZone);
//       // print(_countryList[0].population);
//       // print(_countryList[0].independent);
//       // print(_countryList[162].currency.runtimeType);
//       // print(_countryList.length);
//       return _countryList;
//     } else{ throw Exception('Unable to load the stuff');}
//   }
// }
class ApiServices {
  Future<List<Country>> fetchCountries() async {
    List<Country> _countryList = [];
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    if( response.statusCode == 200) {
      List<dynamic> values = <dynamic>[];
      values = json.decode(response.body);
      if(values.isNotEmpty) {
        for(int i = 0; i<values.length; i++) {
          if(values[i] != null) {
            Map<String, dynamic> map = values[i];
            _countryList.add(Country.fromJson(map));
          }
        }
      }
      print(_countryList[0].subregion);
      print(_countryList[0].flag.runtimeType);
      print(_countryList[0].coatOfArm);
      print(_countryList[162].callingCodeRoot);
      print(_countryList[162].callingCodeSuffix.runtimeType);
      print(_countryList[0].region);
      print(_countryList[8].name);
      print(_countryList[8].capital);
      print(_countryList[0].language!.values.first);
      print(_countryList[0].area);
      print(_countryList[0].timeZone![0]);
      print(_countryList[0].population);
      print(_countryList[0].drivingSide);
      print(_countryList[162].independence);
      print(_countryList[162].independence.runtimeType);
      print(_countryList.length);
      return _countryList;
    } else{ throw Exception('Unable to load the stuff');}
  }
}