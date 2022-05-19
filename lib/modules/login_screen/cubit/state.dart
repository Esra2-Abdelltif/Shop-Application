import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class LogInStates
{
  const LogInStates();
}

class InitialLogInStates extends LogInStates{}
class LoginLoadingState extends LogInStates{}
class LoginSuccessState extends LogInStates{}
class LoginErrorState extends LogInStates{
  final String error;
  LoginErrorState(this.error);
}
