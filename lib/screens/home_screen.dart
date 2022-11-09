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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
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
              SizedBox(height: 25),
              SizedBox(
                height: 50,
                child: TextField(
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
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
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
                        children: [
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
                        children: [
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
              )
              // Container(
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       prefixIcon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 16,),
              //       hintText: 'Search Country',
              //       hintStyle: TextStyle(
              //         fontSize: 18,
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //         borderSide: BorderSide.none
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide.none,
              //         borderRadius: BorderRadius.circular(12)
              //       ),
              //       fillColor: Colors.red
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
