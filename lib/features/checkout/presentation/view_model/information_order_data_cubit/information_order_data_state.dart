part of 'information_order_data_cubit.dart';

@immutable
abstract class  InformationOrderDataState {}

class InformationOrderDataInitial extends InformationOrderDataState {}

class InformationOrderDataLoading extends InformationOrderDataState {}

class InformationOrderDataFailure extends InformationOrderDataState {
  final String errMessage;

  InformationOrderDataFailure(this.errMessage);
}
class InformationOrderDataSuccess extends InformationOrderDataState
{
  InformationOrder informationOrder;
  InformationOrderDataSuccess(this.informationOrder);
}
