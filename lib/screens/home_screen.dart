import 'package:country_app/model/country_model.dart';
import 'package:country_app/screens/info_screen.dart';
import 'package:country_app/services/api_service.dart';
import 'package:country_app/services/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CountryController _countryController = Get.put(CountryController());
  final countryLoad = ApiServices();

  void call() async {
    await countryLoad.fetchCountries();
  }

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
                      style: TextStyle(
                          fontSize: 21
                      ),
                      cursorHeight: 21,
                      cursorColor: Colors.grey[400],
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0XFF98A2B3).withOpacity(0.2),
                        hintText: 'Search Country',
                        hintStyle: TextStyle(
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
                              builder: (context) => LanguageList());
                        },
                        child: Container(
                          height: 45,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Color(0XFFA9BBD4),
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
                          print(continents[1]);
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => FilterBottomSheet()
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: const Color(0XFFA9BBD4),
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
                    // ListView.builder(
                    //     itemCount: _countryController.displayList.length,
                    //     itemBuilder: (context, index) {
                    //       return Padding(
                    //         padding: const EdgeInsets.symmetric(vertical: 6.0),
                    //         child: SizedBox(
                    //           height: 50,
                    //           child: GestureDetector(
                    //             onTap: () {
                    //               Get.to(() => InfoScreen(
                    //                 index: index,
                    //                 countryName: _countryController.displayList[index].name!
                    //               ));
                    //             },
                    //             child: Row(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Container(
                    //                   height: 45,
                    //                   width: 45,
                    //                   decoration: BoxDecoration(
                    //                       borderRadius: BorderRadius.circular(12),
                    //                       color: Colors.red
                    //                   ),
                    //                 ),
                    //                 const SizedBox(width: 15,),
                    //                 Column(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(
                    //                       _countryController.displayList[index].name!,
                    //                       style: const TextStyle(
                    //                           fontSize: 17,
                    //                           fontWeight: FontWeight.w500
                    //                       ),
                    //                     ),
                    //                     Text(
                    //                       _countryController.displayList[index].capital!,
                    //                       style: const TextStyle(
                    //                         fontSize: 15,
                    //                         fontWeight: FontWeight.w300,
                    //                       ),
                    //                     )
                    //                   ],
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     }),
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

Widget countryTile(List<Country> countryList) {
  return ListView.builder(
      itemCount: countryList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: SizedBox(
            height: 50,
            child: GestureDetector(
              onTap: () {
                Get.to(() => InfoScreen(
                    index: index,
                    countryName: countryList[index].name!
                ));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // color: Colors.red,
                      image: DecorationImage(
                        image: NetworkImage(countryList[index].flag.toString()),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        countryList[index].name!,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        countryList[index].capital![0],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}

class LanguageList extends StatefulWidget {
  const LanguageList({Key? key}) : super(key: key);

  @override
  State<LanguageList> createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 18, left: 18),
      decoration: const BoxDecoration(
          color: Color(0XFF000F24),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)
          )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Languages',
                style: TextStyle(
                    fontSize: 27,
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
                    margin: EdgeInsets.only(right: 11),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0XFF98A2B3)
                    ),
                    child: Center(child: FaIcon(FontAwesomeIcons.x, size: 12,))
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 200,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'English',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Radio<int>(
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                            print(value);
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'English',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Radio<int>(
                        value: 2,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                            print(value);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
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

class Items {
  String? region;
  Widget? text;
  Items(this.text, this.region);
}
List<String> continents = [
  'Africa',
  'Antarctica',
  'Asia',
  'Australia',
  'Europe',
  'North America',
  'South America'
];
List<String> timeZones = [
  'GMT+1:00',
  'GMT+2:00',
  'GMT+3:00',
  'GMT+4:00',
  'GMT+5:00',
  'GMT+6:00',
  'GMT+7:00',
  'GMT-6:00',
  'GMT-5:00',
  'GMT-4:00',
  'GMT-3:00',
  'GMT-2:00',
  'GMT-1:00',
];
List<Items> items = [
  Items(
      ListView.builder(
        itemCount: continents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 16),
            child: Container(
              // width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    continents[index],
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  // Text('data')
                  Checkbox(
                    value: false,
                    onChanged: null,
                    fillColor: MaterialStateProperty.all<Color>(Colors.white),
                    checkColor: Color(0XFF000F24),
                  )
                ],
              ),
            ),
          );
        },
      ),
      'Continents'
  ),
  Items(
      ListView.builder(
        itemCount: timeZones.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 16),
            child: Container(
              // width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    timeZones[index],
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  // Text('data')
                  Checkbox(
                    value: false,
                    onChanged: null,
                    fillColor: MaterialStateProperty.all<Color>(Colors.white),
                    checkColor: Color(0XFF000F24),
                  )
                ],
              ),
            ),
          );
        },
      ),
      'Time zones'
  ),


  // Items('Hello', 'Time zone')
];

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0XFF000F24),
          borderRadius: BorderRadius.only(
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
                      child: Center(child: const FaIcon(FontAwesomeIcons.x, size: 10,))
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
        ],
      ),
    );
  }
}


class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text('An error occurred',
            style: TextStyle(
                fontSize: 18
            ),
          ),
        ),
        const SizedBox(height: 10,),
        TextButton(
          onPressed: onPressed,
          child: const Text('Try Again',
            style: TextStyle(
                fontSize: 17
            ),
          ),
        )
      ],
    );
  }
}