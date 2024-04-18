part of 'get_Product_cubit.dart';

@immutable
abstract class GetProductState {}

class GetProductInitial extends GetProductState {}
class GetProductLoading extends GetProductState {}
class GetPaginationLoading extends GetProductState {}
class GetPaginationFailure extends GetProductState {
  final String errMessage;

  GetPaginationFailure(this.errMessage);
}
class GetProductFailure extends GetProductState {
  final String errMessage;

  GetProductFailure(this.errMessage);
}
class GetProductSuccess extends GetProductState {
  final List<ProductModel> allProduct;

  GetProductSuccess(this.allProduct);
}
