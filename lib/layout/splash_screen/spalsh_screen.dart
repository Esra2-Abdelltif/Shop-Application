import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/layout/home_layout/home_layout.dart';
import 'package:shop_project/modules/on_boarding_screen/on_boardin_screen.dart';
import 'package:shop_project/shared/Constans/constans.dart';
import 'package:shop_project/shared/Network/local/cacheHelper.dart';

import '../../modules/welcome_screen/welcome_screen.dart';
class SplashSCreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if(onBoarding != null)
    {
      if(Shoptoken!=null)
        widget= HomeLayout();
      else
        widget =WelcomeScreen();
    }
    else{
      OnBoardinScreen();
    }
    print(onBoarding);
    return  AnimatedSplashScreen(
      duration: 400,
      splash: Column(children: [
        Image.asset('assets/images/shopping app logo1.png',width: 150,height: 140),
        SizedBox(height: 15,),
        Text('Sala App',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black54),)
      ]),
      nextScreen: widget,
      splashIconSize: 250,
      splashTransition: SplashTransition.slideTransition,


    );

  }
}
