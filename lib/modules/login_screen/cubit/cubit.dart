import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/modules/login_screen/cubit/state.dart';
import 'package:shop_project/shared/Network/remote/dio_helper.dart';

import '../../../shared/Network/end_point/end_point.dart';

class LoginCubit extends Cubit<LogInStates>
{
  LoginCubit() : super(InitialLogInStates());
  static  LoginCubit get(context) => BlocProvider.of(context);


  void UserLogin({@required String email ,@required String password}){
    emit(LoginLoadingState());
    DioHelper.postData(Url: LOGIN,
        data:{
      'email':email,
      'password':password,
    },
    ).then((value) {
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

}