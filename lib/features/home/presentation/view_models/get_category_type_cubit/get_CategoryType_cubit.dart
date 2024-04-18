  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import '../../../data/models/type_category_model.dart';
import '../../../data/repos/category_type/categoryType_repo.dart';

part 'get_CategoryType_state.dart';

class GetCategoryTypeCubit extends Cubit<GetCategoryTypeState> {
  GetCategoryTypeCubit(this.getCategoryTypeRepo) : super(GetCategoryTypeInitial());
   final GetCategoryTypeRepo getCategoryTypeRepo;

  List<TypeCategoryModel> typeCategory=[];


  List<String> categoryName(){

    List<String> names = typeCategory.map((category) => category.title).toList();
    names.insert(0, "Any");
    return names;
  }
  Future<void> getCategoryType()async
  {
    emit(GetCategoryTypeLoading());

    var result =await getCategoryTypeRepo.getCategoryType();
    result.fold((failure){
      emit(GetCategoryTypeFailure(failure.errmessage));
    }, (allProduct){
      emit( GetCategoryTypeSuccess(allProduct));
      typeCategory=allProduct;
    }
    );

  }
}
