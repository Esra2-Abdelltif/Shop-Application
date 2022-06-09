 import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_project/models/change_favorites_model/change_favorites_model.dart';
import 'package:shop_project/models/favorites_model/favorites_model.dart';

@immutable
abstract class AppStates
{
  const AppStates();
}

class InitialAppStates extends AppStates{}
class AppChangeModeStates extends AppStates{}
class AppChangeBottomNavBarStates extends AppStates{}

 class ChangeIndexCarouselSliderState extends AppStates{}
 class LoadingHomeDataStates extends AppStates{}
 class SuccessHomeDataStates extends AppStates{}
 class ErrorHomeDataStates extends AppStates{
   final String error;
  ErrorHomeDataStates(this.error);
 }

 class LoadingCategoriesDataStates extends AppStates{}
 class SuccessCategoriesDataStates extends AppStates{}
 class ErrorCategoriesDataStates extends AppStates{
   final String error;
   ErrorCategoriesDataStates(this.error);
 }


 class LoadingsChangeFavoritesStates extends AppStates{}
 class SuccessChangeFavoritesSuccessState extends AppStates{
   ChangeIconeFavoriteModel  changeIconeFavoriteModel;

   SuccessChangeFavoritesSuccessState(this.changeIconeFavoriteModel);
 }
 class ErrorChangeFavoritesStates extends AppStates{
   final String error;
   ErrorChangeFavoritesStates(this.error);
 }




 class LoadingGetFavoritesStates extends AppStates{}
 class SuccessGetFavoritesState extends AppStates{
 }
 class ErrorGetFavoritesStates extends AppStates{
   final String error;
   ErrorGetFavoritesStates(this.error);
 }







