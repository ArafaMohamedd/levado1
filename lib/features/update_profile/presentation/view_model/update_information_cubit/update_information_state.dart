part of 'update_information_cubit.dart';

@immutable
abstract class UpdateInformationState {}

class UpdateInformationInitial extends  UpdateInformationState {}

class  UpdateInformationLoading extends  UpdateInformationState {}

class  UpdateInformationFailure extends  UpdateInformationState {
  final String errMessage;

  UpdateInformationFailure(this.errMessage);
}
class  UpdateInformationSuccess extends  UpdateInformationState
{
  String ms;
  UpdateInformationSuccess(this.ms);
}
