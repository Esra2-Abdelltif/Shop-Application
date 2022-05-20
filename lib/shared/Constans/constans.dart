import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shop_project/shared/Network/local/cacheHelper.dart';

//abullah.ali@gmail.com

void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
Future NavigateAndFinsh ({BuildContext context,router})=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => router), (Route<dynamic> route) => false);
//using for boarding screen after login or signup
void Onsubmit({context,router}){
  CacheHelper.saveDate(key: 'onBoarding', value: true).then((value) =>
      NavigateAndFinsh(router:router,context: context)
  );
}