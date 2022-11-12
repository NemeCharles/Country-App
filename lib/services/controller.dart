import 'package:country_app/model/country_model.dart';
import 'package:country_app/services/api_service.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  final _countryService = ApiServices();
  List<Country> _countryList = [];
  List<Country> displayList = [];
  bool isLoading = true;
  bool errorOccurred = false;

  Future<void> callApi() async {
      errorOccurred = false;
      changeBool(true);
      try{_countryList = await _countryService.fetchCountries();}catch(e) {errorOccurred = true;}
      changeBool(false);
      update();
  }

  void getCountryList() async {
    await callApi();
    _countryList.sort((a, b) => a.name!.compareTo(b.name!));
    displayList = _countryList;
    update();
  }

  void searchCountry(String value) {
    displayList = _countryList.where((country) => country.name!.toLowerCase().contains(value.toLowerCase()) ||
    country.capital![0].toString().toLowerCase().contains(value.toLowerCase())).toList();
    update();
  }


  void changeBool(bool newValue) {
    isLoading = newValue;
    update();
  }
}