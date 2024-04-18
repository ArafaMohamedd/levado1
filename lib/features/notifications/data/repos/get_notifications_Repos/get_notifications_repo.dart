import 'package:dartz/dartz.dart';
 import '../../../../../../Core/error/faliure.dart';
import '../../models/notifications_model.dart';

abstract class GetNotificationsRepo {
  Future<Either<Failure, List<NotificationsOrderModel>>> getNotifications();
}
