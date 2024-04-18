import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/Core/Utils/styles.dart';
import 'package:levado/features/home/data/models/cart_model.dart';
import '../../../../detail_product/presentation/view_models/add_to_card_cubit/add_to_card_cubit.dart';
import '../../view_models/get_cart_cubit/get_cart_cubit.dart';



class CartItem extends StatefulWidget {

    CartItem({Key? key,required this.cartItemModel }) : super(key: key);
CartItemModel cartItemModel ;

  @override
  State<CartItem> createState() => _CartItemState();
}
 class _CartItemState extends State<CartItem> {
   late int  qun;
   @override
   void initState() {
     super.initState();
      qun = widget.cartItemModel.qty;
   }
   @override
  Widget build(BuildContext context) {


     return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
         child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
            width: 150,
              height: 150,
              decoration: BoxDecoration(

                image: DecorationImage(
                    image: NetworkImage(
                        widget.cartItemModel.product.image

                    ),
                     ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartItemModel.product.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Color:",
                                style: Styles.textStyle17.copyWith(color: AppColor.primaryColor),
                                children: [
                                  TextSpan(
                                    text:  widget.cartItemModel.color,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )
                                ]),
                          ]),
                        ),

                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Size: ",
                              style: Styles.textStyle17.copyWith(color: AppColor.primaryColor),

                                children: [
                                  TextSpan(
                                    text: widget.cartItemModel.size,
                                    style:const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )
                                ]),
                          ]),
                        ),

                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "price: ",
                                style: Styles.textStyle17.copyWith(color: AppColor.primaryColor),

                                children: [
                                  TextSpan(
                                    text: widget.cartItemModel.price,
                                    style:const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )
                                ]),
                          ]),
                        )
                        ,
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "total: ",
                                style: Styles.textStyle17.copyWith(color: AppColor.primaryColor),

                                children: [
                                  TextSpan(
                                    text: widget.cartItemModel.total,
                                    style:const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )
                                ]),
                          ]),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(

                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(.1),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Center(
                                    child:  IconButton(onPressed: () {

                                      setState(() {
                                        qun=qun+1;

                                      });

                                      BlocProvider.of<AddToCardCubit>(context)
                                          .addToCard(
                                        widget.cartItemModel.product.id.toString(),
                                        widget.cartItemModel.price.toString(),
                                        widget.cartItemModel.color,
                                        widget.cartItemModel.size,
                                        widget.cartItemModel.shippingAmount,
                                        "$qun"
                                      );
                                      BlocProvider.of<GetCartCubit>(context).getCart();

                                    },
                                        icon: const Icon(Icons.add,
                                        size: 25,
                                        color: Colors.white,
                                        )

                                    ),
                                  ),
                                ),
                              ),




                              const SizedBox(
                                width: 15,
                              ),


                              Text(
                                "$qun",
                              style: Styles.textStyle17.copyWith(color: AppColor.primaryColor,fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child:  IconButton(onPressed: () {

                                    setState(() {
                                      qun=qun-1;

                                    });
                                     BlocProvider.of<AddToCardCubit>(context)
                                        .addToCard(
                                        widget.cartItemModel.product.id.toString(),
                                        widget.cartItemModel.price.toString(),
                                        widget.cartItemModel.color,
                                        widget.cartItemModel.size,
                                        widget.cartItemModel.shippingAmount,
                                        "$qun"
                                    );
                                    BlocProvider.of<GetCartCubit>(context).getCart();


                                  },
                                      icon: const Icon(Icons.minimize,
                                        size: 25,
                                        color: Colors.white,
                                      )

                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
