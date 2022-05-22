import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/models/categroy_model/categroy_model.dart';
import 'package:shop_project/models/home_model/home_model.dart';
import 'package:shop_project/shared/Bloc/cubit.dart';
import 'package:shop_project/shared/Bloc/states.dart';
import 'package:shop_project/shared/compoenets/components.dart';

class ProdectScreen extends StatelessWidget {
  const ProdectScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state)
        {
          if(state is InitialAppStates) print('intial state');
        },
        builder: (BuildContext context ,AppStates state) {
          var productmodel=AppCubit.get(context).homeModel;
          var categorymodel=AppCubit.get(context).categroyModel;


          return ConditionalBuilder(
            builder: (context) =>ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder:(context,index)=> buildProductIten(productmodel,categorymodel),
              itemCount: 1),
            condition:AppCubit.get(context).homeModel !=null && AppCubit.get(context).categroyModel !=null,
            fallback: (context)=>  Center(
             child: CircularProgressIndicator(),

            ),);
        },
      )

    );
  }

  Widget buildProductIten(HomeModel modelHome,CategroyModel modelcatergory)=> Column(
    children: [
      //Product Slider
      CarouselSlider(
        options: CarouselOptions(height: 250.0,
            initialPage: 0, //frist image
            enableInfiniteScroll: true , //scroll lw7dh
          reverse: false,//يقلب في تجاه واحد
          aspectRatio: 16/9,
          viewportFraction: 0.9,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          enlargeCenterPage: true,
         // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items:modelHome.data.banners.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Image(image:NetworkImage('${i.image}'),width: double.infinity,fit: BoxFit.cover, );
            },
          );
        }).toList(),
      ),






  ],);
}
