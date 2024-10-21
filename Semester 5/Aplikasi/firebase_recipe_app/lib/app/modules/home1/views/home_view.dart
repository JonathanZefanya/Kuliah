import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/icon_person.png'),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.settings,
                        )),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Text("Newest Recipes",
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 42, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 350,
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[100],
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Stack(children: [
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 450,
                          child: Image.network('https://picsum.photos/200/300',
                              fit: BoxFit.cover),
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Breakfast",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Breakfast",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                    Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.green,
                          ),
                        )),
                    Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Creamy Meatball & Pasta",
                                  style: GoogleFonts.playfairDisplay(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                              SizedBox(
                                height: 10,
                              ),
                              const Text(
                                  "Creamy Meatball & PastaCreamy Meatball & PastaCreamy Meatball & PastaCreamy Meatball & PastaCreamy Meatball & Pasta",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5),
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "25 min",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
