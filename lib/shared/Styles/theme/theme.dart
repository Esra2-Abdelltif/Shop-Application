import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_project/shared/Styles/colors.dart';

ThemeData darkthemes = ThemeData(
    primarySwatch: defultColor,
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
      titleSpacing: 15,
      iconTheme: IconThemeData(color: Colors.white),
      backwardsCompatibility: false,
      backgroundColor:HexColor('333739'),
      elevation: 0,
      titleTextStyle: TextStyle(
        color:Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        //fontStyle: FontStyle.italic
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness:Brightness.light,
        // statusBarBrightness: Brightness.dark,

      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Color(0xFF8D8E98),
      backgroundColor:HexColor('333739'),
      elevation: 20,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white,),
      bodyText2:  TextStyle(fontSize: 16, color: Colors.white),
    ),
    fontFamily: 'janna',

);
ThemeData lightthemes = ThemeData(
    primarySwatch: defultColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleSpacing: 15,
      iconTheme: IconThemeData(color: Colors.black),
//backwardsCompatibility: true,
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color:Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
//fontStyle: FontStyle.italic
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness:Brightness.dark,
// statusBarBrightness: Brightness.dark,

      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Color(0xFF8D8E98),
      backgroundColor: Colors.white,
      elevation: 20,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black),
      bodyText2:  TextStyle(fontSize: 16, color: Colors.black),

    ),
    fontFamily: 'janna',


);