import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/core/widgets/heart_Button.dart';
import '../../../../../Core/Utils/colors.dart';
import '../../../../../Core/Utils/styles.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../home/presentation/view/widget/loaging_widget.dart';
import '../../../data/models/product_byBrand_model.dart';
import '../../view_models/get_Product_by_prand_cubit/get_Product_by_prand_cubit.dart';
import 'fadeanimation.dart';

class ListPopularBrandProductWidget extends StatelessWidget{
  const ListPopularBrandProductWidget({super.key,required this.productList});
  final List<ProductByBrandModel> productList;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<GetProductByBrandCubit, GetProductByBrandState>(
        listener: (context, state) {
          if (state is  GetProductByBrandSuccess) {
           productList.addAll(state.allProductByBrand);
           }
        },
        builder: (context, state) {
          if (state is GetProductByBrandSuccess || state is GetPaginationLoading || state is GetPaginationFailure) {
            return  Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: (100/140),
                ),

                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount:  productList.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                      onTap: () {
                        context.push(AppRouter.kDetailProductView, extra:{
                          "slug":productList[index].slug,
                          'id':"${productList[index].id}",
                        });
                      },
                      child:  Container(
                        width: width/2,
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

                            Container(

                              decoration: BoxDecoration(
                                color: AppColor.backItemColor,
                              ),
                              child:    Column(
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      HeartButton(id:  productList[index].id,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 120,
                                    width: 120,
                                    child: FadeAnimation(
                                      delay: 1.5,
                                      child: CachedNetworkImage(

                                        imageUrl: productList[index].image,
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "${productList[index].category}",
                              style: Styles.textStyle16.copyWith(color: AppColor.textBodyGre),
                            ),
                            Text(
                              "${productList[index].title}",
                              style: Styles.textStyle17.copyWith(
                                color: AppColor.textBodyColor,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),


                            Row(
                              children: [
                                Text(
                                  "\$${productList[index].price}",
                                  style: Styles.textStyle25.copyWith(color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                                ),
                              ],
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
      else if(state is GetProductByBrandFailure){

        return const Center(child: CustomErrorWidget(errorMessage: 'Failed to load data. Please try again later.', key: null,));

      }else{
        return     Center(child: LoadingWidget());
          }
        },
    );
  }
}