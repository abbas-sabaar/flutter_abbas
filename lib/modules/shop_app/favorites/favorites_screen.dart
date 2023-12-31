import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_abbas/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_abbas/layout/shop_app/cubit/states.dart';
import 'package:flutter_abbas/models/shop_app/favorites_model.dart';
import 'package:flutter_abbas/shared/components/components.dart';
import 'package:flutter_abbas/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return ConditionalBuilder(
          condition: states is! ShopLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildFavItme(
                ShopCubit.get(context).favoritesModel!.data!.data![index],
                context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount:
                ShopCubit.get(context).favoritesModel!.data!.data!.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildFavItme(FavoritesData model, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage('${model.product!.image}'),
                    height: 120.0,
                    width: 120.0,
                  ),
                  if (model.product!.discount != 0)
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.product!.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.product!.price}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: defaultColor,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        if (model.product!.discount != 0)
                          Text(
                            '${model.product!.oldPrice}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            ShopCubit.get(context)
                                .changeFavorites(model.product!.id!);

                            // print(model.id);
                          },
                          icon: CircleAvatar(
                            radius: 15.0,
                            backgroundColor: ShopCubit.get(context)
                                    .favorites[model.product!.id]!
                                ? defaultColor
                                : Colors.grey,
                            child: Icon(
                              Icons.favorite_border,
                              size: 18.0,
                              color: Colors.white,
                            ),
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
