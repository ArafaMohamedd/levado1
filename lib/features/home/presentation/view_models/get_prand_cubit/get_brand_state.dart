part of 'get_brand_cubit.dart';

@immutable
abstract class GetBrandState {}

class GetBrandInitial extends GetBrandState {}
class GetBrandLoading extends GetBrandState {}

class GetBrandFailure extends GetBrandState {
  final String errMessage;

  GetBrandFailure(this.errMessage);
}
class GetBrandSuccess extends GetBrandState {
  final List<BrandModel> allBrandType;

  GetBrandSuccess(this.allBrandType);
}
