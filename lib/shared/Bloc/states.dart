 import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AppStates
{
  const AppStates();
}

class InitialAppStates extends AppStates{}
class AppChangeModeStates extends AppStates{}
class AppChangeBottomNavBarStates extends AppStates{}
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









