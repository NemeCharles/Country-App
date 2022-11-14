import 'package:flutter/material.dart';

class ItemsModel {
  String? title;
  Widget? checkBox;
  ItemsModel({this.checkBox, this.title});
}

class FilterModel {
  String? filterText;
  bool isChecked = false;
  FilterModel({this.filterText, this.isChecked = false});
}

