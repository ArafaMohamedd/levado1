part of 'get_Product_by_category_cubit.dart';

@immutable
abstract class GetProductByCategoryState {}

class GetProductByCategoryInitial extends GetProductByCategoryState {}
class GetProductByCategoryLoading extends GetProductByCategoryState {}
class GetPaginationLoading extends GetProductByCategoryState {}
class GetProductByCategoryFailure extends GetProductByCategoryState {
  final String errMessage;

  GetProductByCategoryFailure(this.errMessage);
}
class GetPaginationFailure extends GetProductByCategoryState {
  final String errMessage;

  GetPaginationFailure(this.errMessage);
}
class GetProductByCategorySuccess extends GetProductByCategoryState {
  final List<ProductByCategoryModel> allProductByCategory;

  GetProductByCategorySuccess(this.allProductByCategory);
}
