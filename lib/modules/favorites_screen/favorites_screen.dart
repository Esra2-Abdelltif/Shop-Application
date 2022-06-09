import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_project/layout/Bloc/cubit.dart';
import 'package:shop_project/layout/Bloc/states.dart';
import 'package:shop_project/models/favorites_model/favorites_model.dart';
import 'package:shop_project/shared/Styles/colors.dart';
import 'package:shop_project/shared/compoenets/components.dart';

class FavoritesScreen extends StatelessWidget {


  const FavoritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context,AppStates state)
      {
        if(state is InitialAppStates) print('intial state');
      },

      builder: (BuildContext context ,AppStates state) {
        AppCubit cubit =AppCubit.get(context);
        var favoritecubit = AppCubit.get(context).favoritesModelDataModel ;

        return ConditionalBuilder(
            condition: state is! LoadingGetFavoritesStates,
            fallback: (context)=>  Center(
          child: CircularProgressIndicator(),
            ),
            builder: (context) => ListView.separated(
            itemBuilder: ((context, index) => BuildFavorite( AppCubit.get(context).favoritesModelDataModel.data.data[index],context)),
            separatorBuilder: ((context, index) => MyDivider()),
            itemCount: AppCubit.get(context).favoritesModelDataModel.data.data.length));
      }


        );


  }

  Widget BuildFavorite(FavouritesData model,BuildContext context)=> Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      height: 146.0,
      //color: Colors.white,
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
      //width: 150,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 65.0,
                    child: CachedNetworkImage(
                      imageUrl: model.product.image,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: 95.0,
                      height: 95.0,
                      //fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              if (model.product.discount != 0)
                Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(fontSize: 8.0, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 "${model.product.name}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14.0, height: 1.3, color: Colors.grey[800]),
                ),
                //Spacer(),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${model.product.price.toString()}',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: defultColor),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    if (model.product.oldPrice != 0)
                      Text(
                        "${model.product.oldPrice.toString()}",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      onPressed: (){
                        //print(modelHome.data.products[index].id);
                        AppCubit.get(context).ChangeIconFavorites(ProductId: model.product.id);
                      },
                      //  icon: Icon( Icons.favorite_border_rounded,size: 30,)   ,
                      // color: Colors.red  ,
                      icon: (AppCubit.get(context).FavoriteList[model.product.id])?const Icon( Icons.favorite ,size: 30,) :const Icon(Icons.favorite_border)  ,
                      color: (AppCubit.get(context).FavoriteList[model.product.id])? Colors.red : Colors.grey ,
                    ),
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        onPressed: () {
                          AppCubit.get(context).ChangeIconFavorites(ProductId: model.product.id);
                        },
                        icon: Icon(Icons.favorite_border),
                        iconSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
