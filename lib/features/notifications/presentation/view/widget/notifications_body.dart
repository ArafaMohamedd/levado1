import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/core/widgets/error_widget.dart';
import 'package:levado/features/notifications/data/models/notifications_model.dart';
import 'package:levado/features/notifications/presentation/view_model/delete_notifications_cubit/delete_notifications_cubit.dart';
import '../../../../../Core/Utils/colors.dart';
import '../../../../../Core/Utils/styles.dart';
import '../../view_model/get_notifications_cubit/get_notifications_cubit.dart';

class NotificationsBody extends StatelessWidget{
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
        builder: (context, state) {
      if (state is GetNotificationsSuccess) {
     List<NotificationsOrderModel> notifications=   state.allOrderNotifications;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed:  (){
                  context.pop();
                }, icon:    Icon(Icons.arrow_back,color: AppColor.primaryColor,size: 32,)),
                const SizedBox(width: 50,),
                Center(
                  child: Text(
                    "My Notification",
                    style: Styles.textStyle25.copyWith(
                        color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount:notifications.length,
          itemBuilder: (_, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (value) {

               BlocProvider.of<DeleteNotificationsCubit>(context).deleteNotifications("${notifications[index].id}");
          //     BlocProvider.of<GetNotificationsCubit>(context).getNotifications();

              },
              background: Container(
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              child:  Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Order !',style: Styles.textStyle20.copyWith(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),

                      Text('You have paid a total : ${notifications[index].order.total} ',style: Styles.textStyle20.copyWith(color: AppColor.textBodyColor),),
                    ],
                  ),
                  subtitle: Text('payment Status : ${ notifications[index].order.paymentStatus} ',style: Styles.textStyle17.copyWith(color: AppColor.textBodyGre),),
                ),
              ),
            );
          },
        ),


      ],
    );
    }
      else if (state is GetNotificationsFailure) {
        print(state.errMessage);
        return const Center(child: CustomErrorWidget(errorMessage: 'Failed to load data. Please try again later.', key: null,));
      }else {
        return const Center(child: CircularProgressIndicator());
      }
        },
    );

}
}
