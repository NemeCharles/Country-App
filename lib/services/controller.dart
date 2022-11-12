import 'package:country_app/model/country_model.dart';
import 'package:country_app/services/api_service.dart';
import 'package:get/get.dart';
import '../model/filter_models.dart';

class CountryController extends GetxController {
  final _countryService = ApiServices();
  List<Country> _countryList = [];
  List<Country> displayList = [];
  bool isLoading = true;
  bool errorOccurred = false;
  List<ContinentModel> continentList = [
    ContinentModel(continent: 'Africa'),
    ContinentModel(continent: 'Antarctica'),
    ContinentModel(continent: 'Asia'),
    ContinentModel(continent: 'Australia'),
    ContinentModel(continent: 'Australia'),
    ContinentModel(continent: 'Europe'),
    ContinentModel(continent: 'North America'),
    ContinentModel(continent: 'South America'),
  ];

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

  void testingFilter(List<String?> selectedContinents) {
    List<Country> continentLoads = _countryList.
    where((countries) => selectedContinents.
    any((country) => countries.continent!.contains(country!))).toList();
    displayList = continentLoads;
    update();
  }


  void changeBool(bool newValue) {
    isLoading = newValue;
    update();
  }

  void toggleCheckBox(int index, bool? value) {
    continentList[index].isChecked = value!;
    update();
  }

  void resetFilter() {
    _countryList.sort((a, b) => a.name!.compareTo(b.name!));
    displayList = _countryList;
    update();
  }

}