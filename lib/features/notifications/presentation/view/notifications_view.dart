import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/notifications/presentation/view/widget/notifications_body.dart';

import '../../../../core/Utils/api_service.dart';
import '../../data/repos/delete_notifications_Repos/delete_notifications_implemntaion.dart';
import '../../data/repos/get_notifications_Repos/get_notifications_implemntaion.dart';
import '../view_model/delete_notifications_cubit/delete_notifications_cubit.dart';
import '../view_model/get_notifications_cubit/get_notifications_cubit.dart';

class  NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
     return   MultiBlocProvider(
         providers: [
           BlocProvider(

               create: (context) =>
                   GetNotificationsCubit(GetNotificationsRepoImp(ApiService(Dio())))..getNotifications()),

           BlocProvider(

               create: (context) =>
               DeleteNotificationsCubit(DeleteNotificationsRepoImp(ApiService(Dio())))),


         ],

         child: const SafeArea(child: Scaffold(
       body:   NotificationsBody()) ,
         )
     );
  }

}