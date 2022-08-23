import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_announcement/pages/intro_page/intro_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const id = "splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _initTimer(){
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, IntroPage.id);
    });
  }
  @override
  void initState() {
    super.initState();
    _initTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ic_sneakers1.jpg", ),
              fit: BoxFit.cover,
            )
          ),
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(.6),
                      Colors.black.withOpacity(.3),
                      Colors.black.withOpacity(.2),
                      Colors.black.withOpacity(.1),
                      Colors.black.withOpacity(.1),
                    ]
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                 Text("Welcome to", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                 SizedBox(height: 15,),
                 Text("Shoea", style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w900)),
                 SizedBox(height: 15,),
                 Text("The best sneakers and shoes e-commerce app of the century for you fashion needs", style: TextStyle(color: Colors.white),),
              ],
            ),
          )),
    );
  }
}
