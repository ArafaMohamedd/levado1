import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/features/home/presentation/view_models/get_category_type_cubit/get_CategoryType_cubit.dart';
import '../../../../../Core/Utils/styles.dart';
import '../../view_models/get_Product_cubit/get_Product_cubit.dart';
import 'fadeanimation.dart';
import 'loading_categore_widget.dart';

class MiddleCategoriesWidget extends StatelessWidget {
  const MiddleCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return   BlocBuilder<GetCategoryTypeCubit, GetCategoryTypeState>(
      builder: (context, state) {
        if (state is GetCategoryTypeSuccess) {
          final category = state.allCategoryType;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: width * 0.15,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<GetProductCubit>(context).setProductList([]);
                      BlocProvider.of<GetProductCubit>(context).setEndPrice("");
                      BlocProvider.of<GetProductCubit>(context).setBrand("");
                      BlocProvider.of<GetProductCubit>(context).setBeginPrice("");
                      BlocProvider.of<GetProductCubit>(context).setCategory("");
                      BlocProvider.of<GetProductCubit>(context).getProduct(pageNum: 1) ;
                      context.push(
    AppRouter.kAllProductView,
    );},
                      child: Container(
                        width: 100,

                        decoration: BoxDecoration(
                          color: AppColor.backItemColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FadeAnimation(
                          delay: 1,
                          child: Center(
                            child: Text(
                              "All",
                              style: Styles.textStyle17.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColor.textBodyColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            context.push(
                              AppRouter.kProductByCategoryView,
                              extra: category[index].title,
                            );
                          },
                          child: Center(
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColor.backItemColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: FadeAnimation(
                                delay: 1,
                                child: Center(
                                  child: Text(
                                    category[index].title,
                                    style: Styles.textStyle17.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.textBodyColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetCategoryTypeFailure) {
          return const Center();
        } else {
          return const Center(child: LoadingCategoryWidget());
        }
      },
    );

  }
}
