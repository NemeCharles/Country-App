import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/country_model.dart';
import '../model/filter_models.dart';
import '../screens/info_screen.dart';
import 'filter_categories.dart';

// List of filter categories
List<ItemsModel> items = [
  ItemsModel(
    title: 'Continents',
    checkBox: const ContinentFilter(),
  ),
  ItemsModel(
    title: 'Time zones',
    checkBox: const TimeZone()
  ),
  ItemsModel(
      title: 'Region',
      checkBox: const RegionFilter()
  ),
  ItemsModel(
      title: 'Subregion',
      checkBox: const SubregionFilter()
  )
];

// Error message to notify users of errors
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

// The tile for each country available in the list.
// Tapping on a tile navigates you to the info screen
Widget countryTile(List<Country> countryList) {
  return ListView.builder(
    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                            fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        countryList[index].capital![0],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Get.isDarkMode ? const Color(0XFF667085) : const Color(0XFF98A2B3)
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

class DetailTile extends StatelessWidget {
  const DetailTile({
    Key? key, required this.title, required this.value,
  }) : super(key: key);

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            title + ':',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color:  Get.isDarkMode ? const Color(0XFFF2F4F7) : const Color(0XFF1C1917)
            ),
          ),
          const SizedBox(width: 8,),
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
                color:  Get.isDarkMode ? const Color(0XFFF2F4F7) : const Color(0XFF1C1917)
            ),
          )
        ],
      ),
    );
  }
}




