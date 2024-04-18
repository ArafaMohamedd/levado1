import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/core/widgets/heart_Button.dart';
import 'package:levado/features/home/presentation/view_models/wishlist_cubit/wishlist_cubit.dart';
import '../../../../../Core/Utils/colors.dart';
import '../../../../../Core/Utils/styles.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../home/presentation/view/widget/loaging_widget.dart';
 import 'fadeanimation.dart';

class ListWishlistWidget extends StatelessWidget{
  const ListWishlistWidget({super.key});
   @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  BlocBuilder<WishlistCubit,WishlistState>(
      builder: (  context,   state)
        {
          if (state is WishlistSuccess) {
            final wishlistModel = state.wishlistModel;

          return Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0,
              ),

              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: wishlistModel.data!.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                    onTap: () {

                      context.push(AppRouter.kDetailProductView,  extra:{
                        "slug":wishlistModel.data![index].product!.slug,
                        'id':"${wishlistModel.data![index].product!.id}",
                      });
                    },
                    child:  Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(

                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),

                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Expanded(
                            child: Container(
                              width: width / 1.1,
                              // height: width / 5.3,
                              decoration: BoxDecoration(
                                color: AppColor.backItemColor,
                              ),
                              child:   Stack(
                                children: [
                                  Positioned(
                                    left: width /2.7,
                                    //  bottom: width /1.7,
                                    child:   HeartButton(id:  wishlistModel.data![index].product!.id,
                                    ),
                                  ),
                                  FadeAnimation(
                                    delay: 1.5,
                                    child: CachedNetworkImage(
                                      // width: width / 1.7,
                                      //     height: width / 1.7,
                                      imageUrl:  wishlistModel.data![index].product!.image,
                                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "${ wishlistModel.data![index].product!.category}",
                            style: Styles.textStyle17.copyWith(color: AppColor.textBodyGre),
                          ),
                          Text(
                            "${ wishlistModel.data![index].product!.title}",
                            style: Styles.textStyle25.copyWith(color: AppColor.textBodyColor),
                          ),
                          Text(
                            "\$${ wishlistModel.data![index].product!.price}",
                            style: Styles.textStyle25.copyWith(color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5,)
                        ],
                      ),
                    )

                );
              },
            ),
          );
   }
      else if(state is WishlistFailure){

        return const Center(child: CustomErrorWidget(errorMessage: 'Failed to load data. Please try again later.', key: null,));

      }else{
        return     const Center(child: LoadingWidget());
          }
        },
    );
  }
}