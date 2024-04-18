import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
 import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/Core/Utils/styles.dart';
import 'package:levado/core/Utils/app_router.dart';

 import '../../../../../core/widgets/error_widget.dart';
import '../../../data/models/review_model.dart';
import '../../view_models/get_review_Product_cubit/get_review_Product_cubit.dart';

class ReviewWidget extends StatelessWidget {
    ReviewWidget({
    super.key,
    required this.rating,
      required this.productId
  });
 double rating;
 String  productId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReviewProductCubit,GetReviewProductState>(
      builder: (BuildContext context, state) {
        if(state is GetReviewProductSuccess){
          ReviewModel reviewProduct= state.reviewProduct;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Divider(
                color: Colors.grey,
                thickness: 3,
                height: 10,
              ),
const SizedBox(height: 10,),
Row(
  children: [
    RatingBar.builder(
      itemSize: 35,
      ignoreGestures: true,
      tapOnlyMode: true,
      glow: true,
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating:  true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    ),
const Spacer(),
    CircleAvatar(
        backgroundColor: AppColor.primaryColor,
        child: IconButton(onPressed:  (){

          context.push(AppRouter.kAddReviewsView,extra:productId);



        }, icon:  const Icon(Icons.add))),
    const SizedBox(width: 7,)
  ],
),

              Text("Reviews",style: Styles.textStyle20.copyWith(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviewProduct.reviews.length,
                itemBuilder: (context, index) {
                  final review =reviewProduct.reviews[index];
                  final profile = reviewProduct.reviews[index].profile;

                  return Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: profile.image.isEmpty
                            ? NetworkImage(profile.image as String)
                            : const AssetImage('assets/images/boy.png') as ImageProvider,
                      ),
                      title: Text(profile.fullName,style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold,color: AppColor.textBodyColor), ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(review.review,style: Styles.textStyle20.copyWith(color: AppColor.textBodyGre),),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              Text( "Rating : ",style: Styles.textStyle20.copyWith(color: AppColor.textBodyColor),),

                              RatingBar.builder(
                                itemSize: 20,
                                ignoreGestures: true,
                                tapOnlyMode: true,
                                glow: true,
                                initialRating: review.rating.toDouble() ,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating:  true,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              const SizedBox(width: 5.0),
                             ],
                          ),
                          const SizedBox(height: 5.0),
                         ],
                      ),
                    ),
                  );
                },
              )




            ],
          );
        } else if (state is GetReviewProductFailure) {
          return const Center(child: CustomErrorWidget(errorMessage: 'Failed to load  Review. Please try again later.', key: null,));

        } else {
          return const Center(child: Center(child: CircularProgressIndicator()));
        }

      },

    );
  }
}