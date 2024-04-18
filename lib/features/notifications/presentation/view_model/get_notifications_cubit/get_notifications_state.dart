part of 'get_notifications_cubit.dart';

@immutable
abstract class GetNotificationsState {}

class GetNotificationsInitial extends GetNotificationsState {}
class GetNotificationsLoading extends GetNotificationsState {}

class GetNotificationsFailure extends GetNotificationsState {
  final String errMessage;

  GetNotificationsFailure(this.errMessage);
}
class GetNotificationsSuccess extends GetNotificationsState {
  final List<NotificationsOrderModel> allOrderNotifications;

  GetNotificationsSuccess(this.allOrderNotifications);
}
