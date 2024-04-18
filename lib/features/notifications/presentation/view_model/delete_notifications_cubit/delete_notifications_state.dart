part of 'delete_notifications_cubit.dart';

@immutable
abstract class DeleteNotificationsState {}

class DeleteNotificationsInitial extends DeleteNotificationsState {}
class DeleteNotificationsLoading extends DeleteNotificationsState {}

class DeleteNotificationsFailure extends DeleteNotificationsState {
  final String errMessage;

  DeleteNotificationsFailure(this.errMessage);
}
class DeleteNotificationsSuccess extends DeleteNotificationsState {
  final  String  mas;

  DeleteNotificationsSuccess(this.mas);
}
