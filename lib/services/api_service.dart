import 'dart:convert';
import 'package:country_app/model/country_model.dart';
import 'package:http/http.dart' as http;

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
      return _countryList;
    } else{ throw Exception('Unable to load the stuff');}
  }
}