import 'package:country_app/services/api_service.dart';
import 'package:country_app/services/controller.dart';
import 'package:country_app/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CountryController _countryController = Get.put(CountryController());
  final countryLoad = ApiServices();

  @override
  void initState() {
    // TODO: implement initState
    _countryController.getCountryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CountryController>(builder: (_) {
          if(_countryController.isLoading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if(_countryController.errorOccurred) {
            return ErrorMessage(
              onPressed: () {
                _countryController.getCountryList();
              },
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Explore',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ThemeServices().toggleTheme();
                          });
                        },
                        child: Icon(
                            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      onChanged: (value) {
                        _countryController.searchCountry(value);
                      },
                      style:const TextStyle(
                          fontSize: 21
                      ),
                      cursorHeight: 21,
                      cursorColor: Colors.grey[400],
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0XFF98A2B3).withOpacity(0.2),
                        hintText: 'Search Country',
                        hintStyle: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w300
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none
                        ),
                        prefixIcon: const Icon(Icons.search_rounded, size: 25,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => const LanguageList());
                        },
                        child: Container(
                          height: 45,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Get.isDarkMode ? const Color(0XFFA9B8D4) : const Color(0XFFA9BBD4),
                                  width: 0.8
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              FaIcon(FontAwesomeIcons.globe, size: 17,),
                              Text(
                                'EN',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => const FilterBottomSheet()
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Get.isDarkMode ? const Color(0XFFA9BBD4) : const Color(0XFFA9B8D4),
                                  width: 0.8
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              FaIcon(FontAwesomeIcons.filter, size: 17,),
                              Text(
                                'Filter',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Expanded(
                    child: countryTile(_countryController.displayList)
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}


class LanguageList extends StatefulWidget {
  const LanguageList({Key? key}) : super(key: key);

  @override
  State<LanguageList> createState() => _LanguageListState();
}
List<String> languages = [
  'English',
  'Deutsch',
  'Francais',
  'Español',
  'Italiano',
  'portuguese',
  'Svenska'
];
class _LanguageListState extends State<LanguageList> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 18, left: 18),
      decoration: BoxDecoration(
          color: Get.isDarkMode ? const Color(0XFF000F24) : const Color(0XFFE5E5E5),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)
          )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Languages',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(right: 11),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0XFF98A2B3)
                    ),
                    child: const Center(child: FaIcon(FontAwesomeIcons.x, size: 12,))
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Flexible(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        languages[index],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Radio<int>(
                        value: index,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final CountryController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryController>(builder: (_) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Get.isDarkMode ? const Color(0XFF000F24) : const Color(0XFFE5E5E5),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)
            )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 18, left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filter',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 17,
                        width: 17,
                        margin: const EdgeInsets.only(right: 11),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0XFF98A2B3)
                        ),
                        child: const Center(child: FaIcon(FontAwesomeIcons.x, size: 10,))
                    ),
                  )
                ],
              ),
            ),
            ExpansionPanelList.radio(
              expandedHeaderPadding: EdgeInsets.zero,
              elevation: 0,
              dividerColor: Colors.transparent,
              children: items.map((item) => ExpansionPanelRadio(
                backgroundColor: context.theme.backgroundColor,
                headerBuilder: (context, isExpanded) => Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.region!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          ),
                        ),
                    ],
                  ),
                ),
                body: SizedBox(child: item.text!, height: 350),
                value: item.region!,
              )).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _controller.resetFilter();
                      Navigator.pop(context);
                    },
                    child: const Text(
                        'Reset',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(const BorderSide(width: 0.8, color: Color(0XFFA9BBD4))),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(85, 40))
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if(_controller.continentList.any((element) => element.isChecked == true)) {
                        var continents = _controller.continentList.where((continent) =>
                        continent.isChecked).map((test) => test.continent).toList();
                        _controller.testingFilter(continents);
                        Navigator.pop(context);
                      }else{
                        print('No continent selected');
                      }
                    },
                    child: const Text(
                        'Show results',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(const BorderSide(width: 0.8, color: Color(0XFFFF6C00))),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(170, 40)),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0XFFFF6C00))
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17,)
          ],
        ),
      );
    });

  }
}

