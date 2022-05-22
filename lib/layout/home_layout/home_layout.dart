import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/modules/favorites_screen/favorites_screen.dart';
import 'package:shop_project/shared/Bloc/cubit.dart';
import 'package:shop_project/shared/Constans/constans.dart';
import 'package:shop_project/shared/Styles/colors.dart';

import '../../shared/Bloc/states.dart';


class HomeLayout extends StatelessWidget {

  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state)
        {
        },
        builder: (BuildContext context ,AppStates state)
        {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: ScaffoldKey,
            appBar: AppBar(

                title: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/images/shopping app logo1.png',),
                ),
                SizedBox(
                  width: 10,),
                Text('Salaa ',style: TextStyle( fontFamily: 'Pacifico',color: defultColor,fontSize: 24))
              ],
            ),
                actions: [
                IconButton(
                    onPressed: (){
                      NavigateTo(router: FavoritesScreen(),context: context);
                    }, icon: Icon(Icons.favorite ,color: defultColor,size: 30,)),
            ]),
            body: cubit.Screen[cubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomNavigation,
              currentIndex: cubit.CurrentIndex,
              onTap: (index) {
                cubit.ChangeIndex(index);
              },
            ),



          );
        }

    );
  }
}
