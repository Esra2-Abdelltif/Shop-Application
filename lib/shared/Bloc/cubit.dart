

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/modules/Setting/setting.dart';
import 'package:shop_project/modules/cart_screen/cart_screen.dart';
import 'package:shop_project/modules/cateogries_screen/cateogries_screen.dart';
import 'package:shop_project/modules/prodect_Screen/prodect_Screen.dart';
import 'package:shop_project/shared/Bloc/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialAppStates());
  static  AppCubit get(context) => BlocProvider.of(context);

  //Dark Mode
  bool IsDark=false;
  void ChangeAppMode(){
    IsDark = !IsDark;
    emit(AppChangeModeState());
  }


  //BottomNavBarState
  int CurrentIndex = 0;
  List<dynamic>  Prodect =[];
  List<dynamic> Cateogries =[];
  List<dynamic>  Cart =[];
  List<dynamic>  Favorites =[];
  List<dynamic> Search =[];
  List<dynamic> setting=[];


  // FancyBottomNavigation

  List<BottomNavigationBarItem> bottomNavigation= const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.category), label: 'Cateogries'),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> Screen = [
    ProdectScreen(),
    CateogriesScreen(),
    CartScreen(),
    Setting(),

  ];

  void ChangeIndex(int index){
    CurrentIndex=index;
    // if (index==1)getSport();
    // if (index==2)getScience();

    emit(AppChangeBottomNavBarState());
  }



}
