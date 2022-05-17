

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/shared/Bloc/states.dart';

class NewsCubit extends Cubit<NewsStates>
{
 NewsCubit() : super(InitialNewsStates());
  static  NewsCubit get(context) => BlocProvider.of(context);



  bool IsDark=false;
  void ChangeAppMode(){
    IsDark = !IsDark;
    emit(AppChangeModeState());
  }




}
