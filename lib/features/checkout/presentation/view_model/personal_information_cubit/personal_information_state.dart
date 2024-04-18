part of 'personal_information_cubit.dart';

@immutable
abstract class PersonalInformationState {}

class PersonalInformationInitial extends PersonalInformationState {}

class PersonalInformationLoading extends PersonalInformationState {}

class PersonalInformationFailure extends PersonalInformationState {
  final String errMessage;

  PersonalInformationFailure(this.errMessage);
}
class PersonalInformationSuccess extends PersonalInformationState
{
  String ms;
  PersonalInformationSuccess(this.ms);
}
