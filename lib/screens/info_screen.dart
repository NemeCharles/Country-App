import 'package:country_app/model/country_model.dart';
import 'package:country_app/services/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: Text(
          countryName,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500
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
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_controller.flag.toString())
                      )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  DetailTile(title: 'Population', value: _countryController.displayList[index].population.toString()),
                  DetailTile(title: 'Region', value: _controller.region!),
                  DetailTile(title: 'Capital', value: _controller.capital![0]),
                  const DetailTile(title: 'Motto', value: 'Unknown'),
                  const SizedBox(height: 25,),
                  DetailTile(title: 'Official language', value: _controller.language!.values.first),
                  DetailTile(title: 'Ethnic group', value: 'Unknown'),
                  DetailTile(title: 'Religion', value: 'Unknown'),
                  DetailTile(title: 'Government', value: 'Unknown'),
                  const SizedBox(height: 25,),
                  DetailTile(title: 'Independent', value: _controller.independence.toString()),
                  DetailTile(title: 'Area', value: '${_controller.area}km'),
                  DetailTile(title: 'Currency', value: _controller.currency!.values.first['name']),
                  const SizedBox(height: 25,),
                  DetailTile(title: 'Time zone', value: _controller.timeZone![0]),
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
              fontSize: 18
            ),
          ),
          SizedBox(width: 8,),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: Color(0XFFF2F4F7)
            ),
          )
        ],
      ),
    );
  }
}
