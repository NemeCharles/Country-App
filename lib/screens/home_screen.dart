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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0XFF98A2B3),
                  hintText: 'Search Country',
                  hintStyle: TextStyle(
                    fontSize: 18
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none
                    ),
                  prefixIcon: Icon(Icons.search_rounded, size: 16,),

                ),
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
