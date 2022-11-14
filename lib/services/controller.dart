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
  List<FilterModel> timeZoneList = [
    FilterModel(filterText: 'UTC', isChecked: false),
    FilterModel(filterText: 'UTC+01:00',),
    FilterModel(filterText: 'UTC+02:00'),
    FilterModel(filterText: 'UTC+03:00'),
    FilterModel(filterText: 'UTC+04:00'),
    FilterModel(filterText: 'UTC+05:00'),
    FilterModel(filterText: 'UTC+06:00'),
    FilterModel(filterText: 'UTC+07:00'),
    FilterModel(filterText: 'UTC+08:00'),
    FilterModel(filterText: 'UTC+09:00'),
    FilterModel(filterText: 'UTC+10:00'),
    FilterModel(filterText: 'UTC+11:00'),
    FilterModel(filterText: 'UTC+12:00'),
    FilterModel(filterText: 'UTC+13:00'),
    FilterModel(filterText: 'UTC-13:00'),
    FilterModel(filterText: 'UTC-12:00'),
    FilterModel(filterText: 'UTC-11:00'),
    FilterModel(filterText: 'UTC-10:00'),
    FilterModel(filterText: 'UTC-09:00'),
    FilterModel(filterText: 'UTC-08:00'),
    FilterModel(filterText: 'UTC-07:00'),
    FilterModel(filterText: 'UTC-06:00'),
    FilterModel(filterText: 'UTC-05:00'),
    FilterModel(filterText: 'UTC-04:00'),
    FilterModel(filterText: 'UTC-03:00'),
    FilterModel(filterText: 'UTC-02:00'),
    FilterModel(filterText: 'UTC-01:00'),
  ];

  List<FilterModel> subregionList = [
    FilterModel(filterText: 'Caribbean'),
    FilterModel(filterText: 'Central Asia'),
    FilterModel(filterText: 'Eastern Asia'),
    FilterModel(filterText: 'Southern Asia'),
    FilterModel(filterText: 'South-Eastern Asia'),
    FilterModel(filterText: 'Western Asia'),
    FilterModel(filterText: 'Eastern Africa'),
    FilterModel(filterText: 'Northern Africa'),
    FilterModel(filterText: 'Southern Africa'),
    FilterModel(filterText: 'Western Africa'),
    FilterModel(filterText: 'North America'),
    FilterModel(filterText: 'South America'),
    FilterModel(filterText: 'Central Europe'),
    FilterModel(filterText: 'Northern Europe'),
    FilterModel(filterText: 'Southeast Europe'),
    FilterModel(filterText: 'Southern Europe'),
    FilterModel(filterText: 'Western Europe'),
    FilterModel(filterText: 'Australia and New Zealand'),
    FilterModel(filterText: 'Malenesia'),
    FilterModel(filterText: 'Micronesia'),
    FilterModel(filterText: 'Polynesia'),
  ];

  List<FilterModel> regionList = [
    FilterModel(filterText: 'Africa'),
    FilterModel(filterText: 'Americas'),
    FilterModel(filterText: 'Asia'),
    FilterModel(filterText: 'Europe'),
    FilterModel(filterText: 'Oceania'),
  ];

  List<FilterModel> continentList = [
    FilterModel(filterText: 'Africa'),
    FilterModel(filterText: 'Antarctica'),
    FilterModel(filterText: 'Asia'),
    FilterModel(filterText: 'Australia'),
    FilterModel(filterText: 'Australia'),
    FilterModel(filterText: 'Europe'),
    FilterModel(filterText: 'North America'),
    FilterModel(filterText: 'South America'),
  ];

  Future<void> callApi() async {
      errorOccurred = false;
      changeBool(true);
      try{_countryList = await _countryService.fetchCountries();}catch(e) {errorOccurred = true;
      print(e);}
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
  // Filters the country list according to selected categories and items
  void filterList(List<String?> selectedContinents, List<String?> selectedRegions, List<String?> selectedSubregions, List<String?> selectedTimeZones) {

    List<Country> filteredList = _countryList.where((countries) =>
    selectedContinents.any((country) => countries.continent!.contains(country!)) ||
        selectedRegions.any((region) => countries.region!.contains(region!)) ||
    selectedSubregions.any((subregion) => countries.subregion!.contains(subregion!)) ||
    selectedTimeZones.any((timeZone) => countries.timeZone![0].contains(timeZone!))).toList();
    displayList = filteredList;
    update();
  }

  void changeBool(bool newValue) {
    isLoading = newValue;
    update();
  }

  void toggleCheckBox(FilterModel filterModel, bool? value) {
    filterModel.isChecked = value!;
    update();
  }

  void resetCheckBoxes() {
    var resetContinents = continentList.where((element) => element.isChecked).toList();
    var resetTimeZone = timeZoneList.where((element) => element.isChecked).toList();
    var resetRegion = regionList.where((element) => element.isChecked).toList();
    var resetSubregion = subregionList.where((element) => element.isChecked).toList();
    for(var continent in resetContinents) {
      continent.isChecked = false;
    }
    for(var timeZone in resetTimeZone) {
      timeZone.isChecked = false;
    }
    for(var region in resetRegion) {
      region.isChecked = false;
    }
    for(var subregion in resetSubregion) {
      subregion.isChecked = false;
    }
    update();
  }

  // Function to reset all checkedboxes to unchecked state
  void resetFilter() {
    resetCheckBoxes();
    _countryList.sort((a, b) => a.name!.compareTo(b.name!));
    displayList = _countryList;
    update();
  }

}
