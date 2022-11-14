import 'package:country_app/model/country_model.dart';
import 'package:country_app/services/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utilities/components.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key, required this.index, required this.countryName}) : super(key: key);
  final int index;
  final String countryName;

  @override
  Widget build(BuildContext context) {
    final CountryController _countryController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 25,
            color: Get.isDarkMode? const Color(0XFFEAECF0) : const Color(0XFF1C1917),),
        ),
        title: Text(
          countryName,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode? const Color(0XFFEAECF0) : const Color(0XFF1C1917)
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<CountryController>(builder: (_) {
          Country _controller = _countryController.displayList[index];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 210,
                    child: PageView(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(_controller.flag.toString())
                              )
                          ),
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(_controller.coatOfArm.toString())
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  DetailTile(title: 'Population', value: _countryController.displayList[index].population.toString()),
                  DetailTile(title: 'Region', value: _controller.region!),
                  DetailTile(title: 'Capital', value: _controller.capital![0]),
                  DetailTile(title: 'Sub region', value: _controller.subregion!),
                  const SizedBox(height: 25,),
                  DetailTile(title: 'Official language', value: _controller.language!.values.first),
                  const DetailTile(title: 'Ethnic group', value: 'Unknown'),
                  const DetailTile(title: 'Religion', value: 'Unknown'),
                  const DetailTile(title: 'Government', value: 'Unknown'),
                  const SizedBox(height: 25,),
                  DetailTile(title: 'Independent', value: _controller.independence.toString()),
                  DetailTile(title: 'Area', value: '${_controller.area}km'),
                  DetailTile(title: 'Currency', value: _controller.currency!.values.first['name']),
                  const DetailTile(title: 'GDP', value: 'Unknown'),
                  const SizedBox(height: 25,),
                  DetailTile(title: 'Time zone', value: _controller.timeZone![0]),
                  const DetailTile(title: 'Date format', value: 'Unknown'),
                  DetailTile(title: 'Dialing code', value: '${_controller.callingCodeRoot}${_controller.callingCodeSuffix![0]}'),
                  DetailTile(title: 'Driving Side', value: _controller.drivingSide!.capitalizeFirst!)
                ],
              ),
            ),
          );
        })
      ),
    );
  }
}

