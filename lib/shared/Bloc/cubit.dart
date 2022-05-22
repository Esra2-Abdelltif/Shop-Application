

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/models/categroy_model/categroy_model.dart';
import 'package:shop_project/models/home_model/home_model.dart';
import 'package:shop_project/modules/Setting/setting.dart';
import 'package:shop_project/modules/cart_screen/cart_screen.dart';
import 'package:shop_project/modules/cateogries_screen/cateogries_screen.dart';
import 'package:shop_project/modules/prodect_Screen/prodect_Screen.dart';
import 'package:shop_project/shared/Bloc/states.dart';
import 'package:shop_project/shared/Constans/constans.dart';
import 'package:shop_project/shared/Network/end_point/end_point.dart';
import 'package:shop_project/shared/Network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialAppStates());
  static  AppCubit get(context) => BlocProvider.of(context);

  //Dark Mode
  bool IsDark=false;
  void ChangeAppMode(){
    IsDark = !IsDark;
    emit(AppChangeModeStates());
  }


  //BottomNavBarState
  int CurrentIndex = 0;






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

    emit(AppChangeBottomNavBarStates());
  }


  HomeModel homeModel;
  void getHomeData(){
    emit(LoadingHomeDataStates());
    DioHelper.getData(
      Url: HOME,
      token: token,
    ).then((value) {
     homeModel =HomeModel.fromJson(value.data);
    printFullText(homeModel.data.banners[0].image);
     printFullText(homeModel.toString());

     emit(SuccessHomeDataStates());


    }).catchError((error){
      print(error.toString());
      emit(ErrorHomeDataStates(error.toString()));


    });

  }


  CategroyModel categroyModel;
  void getCategoriesData(){
    emit(LoadingCategoriesDataStates());
    DioHelper.getData(
      Url: CATEGORY,
      token: token,
    ).then((value) {
      categroyModel = CategroyModel.fromJson(value.data);
      printFullText(categroyModel.data.firstPageUrl);

      emit(SuccessCategoriesDataStates());


    }).catchError((error){
      print(error.toString());
      emit(ErrorCategoriesDataStates(error.toString()));


    });

  }

}
