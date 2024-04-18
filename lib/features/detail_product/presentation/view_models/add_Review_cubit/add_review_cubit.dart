import 'package:flutter_bloc/flutter_bloc.dart';

 import '../../../data/repos/add_review_repos/add_review_repos_imp.dart';
import '../../../data/repos/add_to_card_repos/add_to_card_repos_imp.dart';
import 'add_review_state.dart';



class AddReviewCubit extends Cubit<AddReviewState> {

  AddReviewCubit(this.addReviewRepo) : super(AddReviewInitial());
  final AddReviewImp addReviewRepo;

  Future<void> addReview(
    String  productId,
      String rate,
      String review,

      )async
  {

    emit(AddReviewLoading());
    var result =await addReviewRepo.addReviewProduct( review, rate, productId);
    result.fold((failure){
      emit(AddReviewFailure(failure.errmessage));
    }, (token){

      emit( AddReviewSuccess(token));

    }
    );

  }


}
