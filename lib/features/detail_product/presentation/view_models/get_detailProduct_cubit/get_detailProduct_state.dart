part of 'get_detailProduct_cubit.dart';

@immutable
abstract class GetDetailProductState {}

class GetDetailProductInitial extends GetDetailProductState {}
class GetDetailProductLoading extends GetDetailProductState {}

class GetDetailProductFailure extends GetDetailProductState {
  final String errMessage;

  GetDetailProductFailure(this.errMessage);
}
class GetDetailProductSuccess extends GetDetailProductState {
  final DetailProductModel detailProduct;

  GetDetailProductSuccess(this.detailProduct);
}
