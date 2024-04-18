  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import '../../../data/models/brand_model.dart';
 import '../../../data/repos/brand_repos/brand_repo.dart';
part 'get_brand_state.dart';

class GetBrandCubit extends Cubit<GetBrandState> {
  GetBrandCubit(this.getBrandRepo) : super(GetBrandInitial());
   final GetBrandRepo getBrandRepo;

  List<BrandModel> brands=[];


  List<String> brandsName(){

    List<String> names = brands.map((brand) => brand.title).toList();
    names.insert(0, "Any");
    return names;
  }

  Future<void> getBrand()async
  {
    emit(GetBrandLoading());

    var result =await getBrandRepo.getBrand();
    result.fold((failure){
      emit(GetBrandFailure(failure.errmessage));
    }, (allProduct){
      emit( GetBrandSuccess(allProduct));
     brands=allProduct;
    }
    );

  }
}
