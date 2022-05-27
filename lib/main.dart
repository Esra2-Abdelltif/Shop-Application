import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/layout/splash_screen/spalsh_screen.dart';
import 'package:shop_project/modules/Setting/setting.dart';
import 'package:shop_project/modules/on_boarding_screen/on_boardin_screen.dart';
import 'package:shop_project/modules/welcome_screen/welcome_screen.dart';
import 'package:shop_project/shared/Bloc/cubit.dart';
import 'package:shop_project/shared/Bloc/observer_bloc.dart';
import 'package:shop_project/shared/Constans/constans.dart';
import 'package:shop_project/shared/Network/local/cacheHelper.dart';
import 'package:shop_project/shared/Network/remote/dio_helper.dart';
import 'package:shop_project/shared/Styles/theme/cubit/cubit.dart';
import 'package:shop_project/shared/Styles/theme/cubit/states.dart';
import 'package:shop_project/shared/Styles/theme/theme.dart';

void main()  async {
  //بيتاكد ان كل حاجه في ميثود خلصت وبعدين يفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  await CacheHelper.init();

  bool IsDark =CacheHelper.getDate(key: 'IsDark');
  Widget widget;
  bool onBoarding =CacheHelper.getDate(key: 'onBoarding');
  token =CacheHelper.getDate(key: 'token');
  print(token);
  if(onBoarding !=null)
    {
      if(token!=null) widget= OnBoardinScreen();
      else widget =WelcomeScreen();
    }
  else{
    OnBoardinScreen();
  }

  print(onBoarding);

  BlocOverrides.runZoned( () {
    runApp( MyApp(IsDark,widget));

  },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool IsDark;
  // bool onBoarding;
  final Widget StartWidget;
  MyApp(this.IsDark,this.StartWidget);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => AppCubit()..getCategoriesData()..getHomeData())),
        BlocProvider(create: (BuildContext context )=>ThemeAppCubit()..ChangeAppMode(fromShared: IsDark))
      ],
      child: BlocConsumer<ThemeAppCubit,ThemeAppStates>(
        listener: (context ,state){},
        builder: (context ,state){
          return  MaterialApp(
            theme: lightthemes,
            darkTheme: darkthemes,
            themeMode: ThemeAppCubit.get(context).IsDark ? ThemeMode.dark :ThemeMode.light ,
            debugShowCheckedModeBanner: false,
            //home:StartWidget,
            home:SplashSCreen(),
          );
        },
      ),
    );
  }
}

