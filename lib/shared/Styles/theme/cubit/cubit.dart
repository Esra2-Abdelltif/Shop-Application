import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/shared/Network/local/cacheHelper.dart';
import 'package:shop_project/shared/Styles/theme/cubit/states.dart';

class ThemeAppCubit extends Cubit<ThemeAppStates>
{
  ThemeAppCubit() : super(InitialThemeAppState());
  static  ThemeAppCubit get(context) => BlocProvider.of(context);

  bool IsDark=false;
  void ChangeAppMode({bool fromShared}){
    if(fromShared != null) {
      IsDark = fromShared;
      emit(AppChangeModeState());
    }
    else {
      IsDark = !IsDark;
      CacheHelper.putDate(key: 'IsDark', value: IsDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }




}
