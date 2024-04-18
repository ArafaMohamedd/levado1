part of 'get_Product_by_prand_cubit.dart';

@immutable
abstract class GetProductByBrandState {}

class GetProductByBrandInitial extends GetProductByBrandState {}
class GetProductByBrandLoading extends GetProductByBrandState {}
class GetPaginationLoading extends GetProductByBrandState {}
class GetPaginationFailure extends GetProductByBrandState {
  final String errMessage;

  GetPaginationFailure(this.errMessage);
}
class GetProductByBrandFailure extends GetProductByBrandState {
  final String errMessage;

  GetProductByBrandFailure(this.errMessage);
}
class GetProductByBrandSuccess extends GetProductByBrandState {
  final List<ProductByBrandModel> allProductByBrand;

  GetProductByBrandSuccess(this.allProductByBrand);
}
