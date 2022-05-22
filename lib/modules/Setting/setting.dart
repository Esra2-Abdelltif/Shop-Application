import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/shared/Styles/colors.dart';
import 'package:shop_project/shared/Styles/theme/cubit/cubit.dart';
import 'package:shop_project/shared/Styles/theme/cubit/states.dart';

import '../../shared/Constans/constans.dart';
import '../welcome_screen/welcome_screen.dart';


class Setting extends StatelessWidget {
  const Setting({ Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(children: [
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Text('General Setting',
              style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18)
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: (){
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Log out ? ',style: TextStyle(color: Colors.white, fontSize: 18)),
                  content: const Text('Do You sure to log out ?',  style: TextStyle(color: Colors.white, fontSize: 18)),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel',  style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    TextButton(
                      onPressed: () {
                        LogOut(context: context,router: WelcomeScreen());

                      },
                      child: const Text('Log out',  style: TextStyle(color:Colors.white, fontSize: 18)),
                    ),
                  ],
                  elevation: 24,
                  backgroundColor: defultColor,
                  // shape: CircleBorder(),
                ),
              );
            },
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: defultColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Log Out',
                  style: Theme.of(context).textTheme.bodyText2,),
                Spacer(),
                Icon(
                  Icons.navigate_next,
                  color:defultColor ,
                  size: 30,
                ),



              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: defultColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(
                  Icons.brightness_2_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Dark Mode',
                style: Theme.of(context).textTheme.bodyText2,),
              Spacer(),
              SwitchTheme(),


            ],
          ),
        ],
      ),
    )
      ]),
    );
  }

}
class SwitchTheme extends StatelessWidget {
  const SwitchTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeAppCubit, ThemeAppStates>(
      listener: (BuildContext context, ThemeAppStates state) {},
      builder: (BuildContext context,  ThemeAppStates state) {
        return CupertinoSwitch(
          value: ThemeAppCubit.get(context).IsDark,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (value) {
            ThemeAppCubit.get(context).ChangeAppMode();
          },
        );
      },
    );
  }
}

