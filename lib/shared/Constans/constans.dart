import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shop_project/shared/Network/local/cacheHelper.dart';

//abullah.ali@gmail.com
dynamic onBoarding =CacheHelper.getDate(key: 'onBoarding');
dynamic Shoptoken =CacheHelper.getDate(key:'token');
String token='FLqiUBD51GDmX2yAjpb44ePr76FbSbn7fWOJr6LhUKLmUPaDO6Ly6vWIxq6O1rYyRG3ZhC';


void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
Future NavigateAndFinsh ({BuildContext context,router})=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => router), (Route<dynamic> route) => false);
//using for boarding screen after login or signup
void Onsubmit({context,router}){
  CacheHelper.saveDate(key:'onBoarding', value: true).then((value) =>
      NavigateAndFinsh(router:router,context: context)
  );
}

void LogOut({context,router}){
  CacheHelper.sharedPreferences.remove('token').then((value) {
    if(value ){
      NavigateAndFinsh(context: context,router: router);
    }

  });
}


void printFullText(String text){

final pattern = RegExp('.{1,800}');

    pattern.allMatches (text). forEach((match) => print(match.group(0)));

}