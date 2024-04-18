import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/delete_notifications_Repos/delete_notifications_repo.dart';
  part 'delete_notifications_state.dart';

class DeleteNotificationsCubit extends Cubit<DeleteNotificationsState> {
  DeleteNotificationsCubit(this.deleteNotificationsRepo) : super(DeleteNotificationsInitial());
  final DeleteNotificationsRepo deleteNotificationsRepo;


  Future<void>  deleteNotifications(String id) async {

      emit(DeleteNotificationsLoading());

    var result = await deleteNotificationsRepo.deleteNotifications(id);
    result.fold((failure) {
         emit(DeleteNotificationsFailure(failure.errmessage));

    }, ( ms) {
      emit(DeleteNotificationsSuccess( ms));
    });
  }
}
