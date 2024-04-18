import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:levado/core/Utils/styles.dart';
import 'package:levado/core/widgets/custom_button.dart';
import 'package:levado/features/detail_product/presentation/view_models/add_to_card_cubit/add_to_card_cubit.dart';
import 'package:levado/features/detail_product/presentation/view_models/add_to_card_cubit/add_to_card_state.dart';
import 'package:levado/features/detail_product/presentation/view_models/get_review_Product_cubit/get_review_Product_cubit.dart';
import 'package:levado/features/detail_product/presentation/views/widgets/product_text_detail.dart';
import 'package:levado/features/detail_product/presentation/views/widgets/review_widget.dart';
import 'package:levado/features/detail_product/presentation/views/widgets/slider_image_widget.dart';

import '../../../../../Core/widgets/Show_Snackbar.dart';
 import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/heart_Button.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../data/models/review_model.dart';
import '../../view_models/get_detailProduct_cubit/get_detailProduct_cubit.dart';
import 'drop_down_wiget.dart';

class DetailProductBody extends StatefulWidget {

  const DetailProductBody({

    super.key,
  });

  @override
  State<DetailProductBody> createState() => _DetailProductBodyState();
}

class _DetailProductBodyState extends State<DetailProductBody> {
  String selectedColor = '';
  String selectedSize = '';
@override
  void initState() {

     super.initState();
  }
  @override
  Widget build(BuildContext context) {

    void onColorSelected(String color) {
      setState(() {
        selectedColor = color;

      });
    }

    void onSizeSelected(String size) {
      setState(() {
        selectedSize = size;

      });
    }

    return BlocBuilder<GetDetailProductCubit, GetDetailProductState>(
      builder: (context, state) {
        if (state is GetDetailProductSuccess) {
          final product = state.detailProduct;
          selectedColor=product.color.map((color) => color.name).toList()[0];
          selectedSize=product.size.map((size) => size.name).toList()[0];
          return BlocConsumer<AddToCardCubit, AddToCardState>(
            listener: (context, state) {
              if (state is AddToCardSuccess) {
                showSnackBar(context,"Added to cart successfully",);
              }

              if (state is AddToCardFailure){
                showSnackBar(context, " Failed to add to cart. Please try again");
              }

                },
            builder: (context, state) {
              return SingleChildScrollView(
                  child: Column(children: [

                SliderImage(
                  listImage:
                      product.gallery.map((gallery) => gallery.image).toList(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTextDetail(
                        title: product.title,
                        category: product.category,
                        regularPrice: product.price,
                        salePrice: product.oldPrice,
                        description: product.description,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          DropDownWidget(
                            itemList: product.color.map((color) => color.name).toList(),
                            selectedItem: product.color.map((color) => color.name).toList()[0],
                            name: 'Color',
                            onItemSelected: onColorSelected,
                          ),
                          const Spacer(),
                          DropDownWidget(
                            itemList:
                                product.size.map((size) => size.name).toList(),
                            selectedItem: product.size
                                .map((size) => size.name)
                                .toList()[0],
                            name: 'Size',
                            onItemSelected: onSizeSelected, // Pass callback function to update selected size
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          CustomButton(
                            height: 50,
                            width: 200,
                            name: "Add to cart".toUpperCase(),
                            textStyle: Styles.textStyle17,
                            onTap: () {
                              print(selectedColor);
                              BlocProvider.of<AddToCardCubit>(context)
                                  .addToCard(
                                product.id.toString(),
                                product.price.toString(),
                                selectedColor,
                                selectedSize,
                                product.shippingAmount,
                                  "1"  ,
                              );
                            },
                          ),
                            Expanded(child: HeartButton(id:product.id,)),
                        ],
                      ),
                      if (state is AddToCardLoading)
                        const Center(child: CircularProgressIndicator()),
const SizedBox(height: 20,),


                 ReviewWidget(rating:  product.productRating, productId: "${product.id}",),
                    ],
                  ),
                )
              ]));
            },
          );
        } else if (state is GetDetailProductFailure) {
          return Container(
            height: 100,
            child: Center(child: Image.asset("assets/images/warning.png")),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}


