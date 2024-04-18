import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repos/productRepos/product_repo.dart';

part 'get_Product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit(this.getProductRepo) : super(GetProductInitial());
  final GetProductRepo getProductRepo;

  String _brand = "";
  String _category = "";
  String _beginPrice = "";
  String _endPrice = "";

  List<ProductModel> _productList = [];

  void setBrand(String brand) {
    _brand = brand;
  }

  void setProductList(List<ProductModel> productList) {
    _productList = productList;

  }

  void setCategory(String category) {
    _category = category;
  }

  void setBeginPrice(String beginPrice) {
    _beginPrice = beginPrice;
  }

  void setEndPrice(String endPrice) {
    _endPrice = endPrice;
  }

  List<ProductModel> getProductList() {
    return _productList;
  }

  void addProductList(List<ProductModel> allProduct) {
    _productList.addAll(allProduct);
  }

  String getBrand() {
    return _brand == "Any" ? "" : _brand;
  }

  String getCategory() {
    return _category == "Any" ? "" : _category;
  }

  String getBeginPrice() {
    return _beginPrice == "0" ? "" : _beginPrice;
  }

  String getEndPrice() {
    return _endPrice == "0" ? "" : _endPrice;
  }

  Future<void> getProduct(
      {int pageNum = 1,
      String brand = "",
      category = "",
      String endPrice = "",
      String beginPrice = ""
      }) async {
    if (pageNum == 1) {
      emit(GetProductLoading());
    } else {
      emit(GetPaginationLoading());
    }
    var result = await getProductRepo.getProduct(
        pageNum: pageNum, brand: brand, category: category, endPrice: endPrice,beginPrice:beginPrice);
    result.fold((failure) {
      if (pageNum == 1) {
        emit(GetProductFailure(failure.errmessage));
      } else {
        emit(GetPaginationFailure(failure.errmessage));
      }
    }, (allProduct) {
      emit(GetProductSuccess(allProduct));
    });
  }
}
