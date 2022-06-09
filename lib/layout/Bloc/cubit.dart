import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/models/categroy_model/categroy_model.dart';
import 'package:shop_project/models/change_favorites_model/change_favorites_model.dart';
import 'package:shop_project/models/favorites_model/favorites_model.dart';
import 'package:shop_project/models/home_model/home_model.dart';
import 'package:shop_project/modules/Setting/setting.dart';
import 'package:shop_project/modules/cart_screen/cart_screen.dart';
import 'package:shop_project/modules/cateogries_screen/cateogries_screen.dart';
import 'package:shop_project/modules/favorites_screen/favorites_screen.dart';
import 'package:shop_project/modules/prodect_Screen/prodect_Screen.dart';
import 'package:shop_project/layout/Bloc/states.dart';
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


  // FancyBottomNavigation

  List<BottomNavigationBarItem> bottomNavigation= const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.category), label: 'Cateogries'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'Favorite'),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> Screen = [
    ProdectScreen(),
    CateogriesScreen(),
    FavoritesScreen(),
    CartScreen(),
    Setting(),

  ];
  //BottomNavBarState
  int CurrentIndex = 0;
  void ChangeIndex(int index){
    CurrentIndex=index;
    emit(AppChangeBottomNavBarStates());
  }


//Select Favorite Product
  Map<int,bool> FavoriteList={};
  ChangeIconeFavoriteModel changeIconeFavoriteModel;

  void ChangeIconFavorites({@required int ProductId}){
    FavoriteList[ProductId] = !FavoriteList[ProductId];
    emit(LoadingsChangeFavoritesStates());
    DioHelper.postData(
      Url: FAVORITES,
      data:{
        'product_id':ProductId,
      },
      token: token,
    ).then((value) {
      changeIconeFavoriteModel=  ChangeIconeFavoriteModel.fromJson(value.data);
      print(value.data);
      if(!changeIconeFavoriteModel.status)
      {
        FavoriteList[ProductId] = !FavoriteList[ProductId];
      }
      else{
        getFavoritesData();
      }

      emit(SuccessChangeFavoritesSuccessState(changeIconeFavoriteModel));
    }).catchError((error){
      FavoriteList[ProductId] = !FavoriteList[ProductId];
      print(error.toString());
      emit(ErrorChangeFavoritesStates(error.toString()));
    });
  }

//Move Favorite Product in Favorite Screen
  FavoritesModel favoritesModelDataModel;
  void getFavoritesData(){
    emit(LoadingGetFavoritesStates());
    DioHelper.getData(
      Url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModelDataModel = FavoritesModel.fromJson(value.data);
      printFullText(value.data.toString());


      emit(SuccessGetFavoritesState());


    }).catchError((error){
      print(error.toString());
      emit(ErrorGetFavoritesStates(error.toString()));


    });

  }


//Get Product and Banner Data at Home
  HomeModel homeModel;
  void getHomeData(){
    emit(LoadingHomeDataStates());
    DioHelper.getData(
      Url: HOME,
      token: token,
    ).then((value) {
     homeModel =HomeModel.fromJson(value.data);
    homeModel.data.products.forEach((element) {
       FavoriteList.addAll({element.id: element.inFavorites});
     });
          print(FavoriteList.toString());

     emit(SuccessHomeDataStates());


    }).catchError((error){
      print(error.toString());
      emit(ErrorHomeDataStates(error.toString()));


    });

  }

//Get Gategories Data at Home

 CategoriesDataModel categoriesDataModel;
  void getCategoriesData(){
    emit(LoadingCategoriesDataStates());
    DioHelper.getData(
      Url: Get_CATEGORY,
      token: token,
    ).then((value) {
      categoriesDataModel = CategoriesDataModel.fromJson(value.data);
      printFullText(categoriesDataModel.toString());

      emit(SuccessCategoriesDataStates());


    }).catchError((error){
      print(error.toString());
      emit(ErrorCategoriesDataStates(error.toString()));


    });

  }


  //CarouselSlider
  int indexCarouselSider = 0;
  void ChangeindexCarouselSider(int index) {
    indexCarouselSider = index;
    emit(SuccessCategoriesDataStates());
  }



}

