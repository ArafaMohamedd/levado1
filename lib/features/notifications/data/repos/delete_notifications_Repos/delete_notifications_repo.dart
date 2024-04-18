import 'package:dartz/dartz.dart';
 import '../../../../../../Core/error/faliure.dart';

abstract class DeleteNotificationsRepo {
  Future<Either<Failure,String>> deleteNotifications(String notificationsID);
}
