import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/modules/on_boarding_screen/on_boardin_screen.dart';
import 'package:shop_project/shared/Bloc/cubit.dart';
import 'package:shop_project/shared/Bloc/observer_bloc.dart';
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
  BlocOverrides.runZoned( () {
    runApp( MyApp(IsDark));

  },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool IsDark;
  MyApp(this.IsDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => NewsCubit())),
        BlocProvider(create: (BuildContext context )=>AppCubit()..ChangeAppMode(fromShared: IsDark))
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context ,state){},
        builder: (context ,state){
          return  MaterialApp(
            theme: lightthemes,
            darkTheme: darkthemes,
            themeMode: AppCubit.get(context).IsDark ? ThemeMode.dark :ThemeMode.light ,
            debugShowCheckedModeBanner: false,
            home:OnBoardinScreen(),
          );
        },
      ),
    );
  }
}

