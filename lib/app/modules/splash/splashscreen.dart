import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

     Future.delayed(Duration(seconds: 4), () {
      // Navigate to the HomeView when the delay is complete.
      Get.offNamed('/bottomnavigationbar');
    });
    return  Scaffold(
      body: Center(child:Image.asset('assets/images.png',
                fit:BoxFit.cover ,
                width: double.maxFinite,),
     
      ),
    );
  }
}