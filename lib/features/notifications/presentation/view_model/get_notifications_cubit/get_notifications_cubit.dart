import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/notifications/data/models/notifications_model.dart';
import 'package:levado/features/notifications/data/repos/get_notifications_Repos/get_notifications_repo.dart';
  part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit(this.getNotificationsRepo) : super(GetNotificationsInitial());
  final GetNotificationsRepo getNotificationsRepo;


  Future<void>  getNotifications() async {

      emit(GetNotificationsLoading());

    var result = await getNotificationsRepo.getNotifications();
    result.fold((failure) {
         emit(GetNotificationsFailure(failure.errmessage));

    }, (myOrder) {
      emit(GetNotificationsSuccess(myOrder));
    });
  }
}
