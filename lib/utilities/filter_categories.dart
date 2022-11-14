import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/controller.dart';


class ContinentFilter extends StatelessWidget {
  const ContinentFilter({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final CountryController _controller = Get.find();
    return GetBuilder<CountryController>(builder: (_){
      return ListView.builder(
        itemCount: _controller.continentList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 16),
            child: Container(
              // width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _controller.continentList[index].filterText!,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  Checkbox(
                    value: _controller.continentList[index].isChecked,
                    onChanged: (bool? value) {
                      _controller.toggleCheckBox(_controller.continentList[index], value!);
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
    });

  }
}
class TimeZone extends StatelessWidget {
  const TimeZone({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final CountryController _controller = Get.find();
    return GetBuilder<CountryController>(builder: (_){
      return ListView.builder(
        itemCount: _controller.timeZoneList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 16),
            child: Container(
              // width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _controller.timeZoneList[index].filterText!,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  Checkbox(
                    value: _controller.timeZoneList[index].isChecked,
                    onChanged: (bool? value) {
                      _controller.toggleCheckBox(_controller.timeZoneList[index], value!);
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
    });

  }
}
class RegionFilter extends StatelessWidget {
  const RegionFilter({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final CountryController _controller = Get.find();
    return GetBuilder<CountryController>(builder: (_){
      return ListView.builder(
        itemCount: _controller.regionList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 16),
            child: Container(
              // width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _controller.regionList[index].filterText!,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  Checkbox(
                    value: _controller.regionList[index].isChecked,
                    onChanged: (bool? value) {
                      _controller.toggleCheckBox(_controller.regionList[index], value!);
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
    });

  }
}
class SubregionFilter extends StatelessWidget {
  const SubregionFilter({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final CountryController _controller = Get.find();
    return GetBuilder<CountryController>(builder: (_){
      return ListView.builder(
        itemCount: _controller.subregionList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 16),
            child: Container(
              // width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _controller.subregionList[index].filterText!,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  Checkbox(
                    value: _controller.subregionList[index].isChecked,
                    onChanged: (bool? value) {
                      _controller.toggleCheckBox(_controller.subregionList[index], value!);
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
    });

  }
}
