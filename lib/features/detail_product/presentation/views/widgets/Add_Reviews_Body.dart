import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/Core/Utils/styles.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../Core/Utils/app_router.dart';
import '../../../../../Core/widgets/Show_Snackbar.dart';
import '../../view_models/add_Review_cubit/add_review_cubit.dart';
import '../../view_models/add_Review_cubit/add_review_state.dart';

class AddReviewsBody extends StatefulWidget{
    AddReviewsBody({super.key,required this.productId});
String  productId;
  @override
  State<AddReviewsBody> createState() => _AddReviewsBodyState();
}

class _AddReviewsBodyState extends State<AddReviewsBody> {
  double  _rating=0 ;
  @override
  Widget build(BuildContext context) {
    TextEditingController reviewController = TextEditingController();
      bool isLoading = false;
    return  BlocConsumer<AddReviewCubit, AddReviewState>(
        listener: (context, state) {
      if (state is AddReviewLoading) {
        isLoading = true;
      } else if (state is AddReviewSuccess) {
        context.pop();
        isLoading = false;
      }else if(state is AddReviewFailure){
        isLoading = false;
        showSnackBar(context, state.errMessage);

      }
    },builder:(context,state)=> ModalProgressHUD(
    inAsyncCall: isLoading,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2, top: 15),
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed:  (){
                    context.pop();
                  }, icon:    Icon(Icons.arrow_back,color: AppColor.primaryColor,size: 32,)),
                  const SizedBox(width: 50,),
                  Center(
                    child: Text(
                      "Add Review",
                      style: Styles.textStyle25.copyWith(
                          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: reviewController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Enter your review...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
               if (reviewController.text.isNotEmpty && _rating > 0) {
                 print(widget.productId);
                 print(_rating);
                 print( reviewController.text);

                 BlocProvider.of<AddReviewCubit>(context).addReview(
                     widget.productId ,
                     "${_rating.toInt()}",
                     reviewController.text
                 );
                 reviewController.clear();
                setState(() {
                  _rating = 0.0;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please provide both rating and review')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    )
    ) );
  }
}