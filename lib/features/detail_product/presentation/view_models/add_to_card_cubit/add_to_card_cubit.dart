import 'package:flutter_bloc/flutter_bloc.dart';

 import '../../../data/repos/add_to_card_repos/add_to_card_repos_imp.dart';
import 'add_to_card_state.dart';



class AddToCardCubit extends Cubit<AddToCardState> {

  AddToCardCubit(this.addToCardRepo) : super(AddToCardInitial());
  final AddToCardImp addToCardRepo;

  Future<void> addToCard(
    String  productId,
      String price,
      String color,
      String size,
      String shippingAmount,
       String qun
      )async
  {

    emit(AddToCardLoading());
    var result =await addToCardRepo.addToCardProduct(productId, price, color, size, shippingAmount,qun);
    result.fold((failure){
      emit(AddToCardFailure(failure.errmessage));
    }, (token){

      emit( AddToCardSuccess(token));

    }
    );

  }


}
