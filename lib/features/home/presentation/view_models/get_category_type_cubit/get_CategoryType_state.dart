part of 'get_CategoryType_cubit.dart';

@immutable
abstract class GetCategoryTypeState {}

class GetCategoryTypeInitial extends GetCategoryTypeState {}
class GetCategoryTypeLoading extends GetCategoryTypeState {}

class GetCategoryTypeFailure extends GetCategoryTypeState {
  final String errMessage;

  GetCategoryTypeFailure(this.errMessage);
}
class GetCategoryTypeSuccess extends GetCategoryTypeState {
  final List<TypeCategoryModel> allCategoryType;

  GetCategoryTypeSuccess(this.allCategoryType);
}
