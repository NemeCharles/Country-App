import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
