import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/modules/Setting/setting.dart';
import 'package:shop_project/modules/welcome_screen/welcome_screen.dart';
import 'package:shop_project/shared/Constans/constans.dart';
import 'package:shop_project/shared/Network/local/cacheHelper.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sala'),actions: [
        IconButton(onPressed: (){NavigateTo(router: Setting(),context: context);
      }, icon: Icon(Icons.dark_mode)),
        IconButton(onPressed: (){
          CacheHelper.sharedPreferences.remove('token').then((value) {
            if(value ){
              NavigateAndFinsh(context: context,router: WelcomeScreen());
            }

          });
        }, icon: Icon(Icons.logout)),
      ]),

    );
  }
}
