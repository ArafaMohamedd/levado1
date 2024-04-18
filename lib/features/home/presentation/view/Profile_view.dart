import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/core/Utils/app_shared_preferences.dart';


class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}
class _ProfileBodyState extends State<ProfileBody> {
  @override
  String? email="";
  String? name="";
  @override
   initState()   {
    data();
    super.initState();
  }
   data() async  {
     email= await UserEmailStorage().getUserEmailKey() ;
     name= await UserNameStorage().getUserNameKey();
    setState(()     {

    });
  }
  @override
  Widget build(BuildContext context) {
      UserNameStorage().getUserNameKey();
    return   Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/boy.png'),
          ),
           const Expanded(child: SizedBox(height: 20)),
              Text(
                name!,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold,  color: Colors.black),
          ),
           const SizedBox(height: 10),
              Text(
            email!,
            style: const TextStyle(fontSize: 18,  color: Colors.black),
          ),
           const Expanded(child: SizedBox(height: 30)),
          Expanded(
            flex: 2,
            child : Padding(
                   padding: const EdgeInsets.only(bottom: 15),
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           spreadRadius: 2,
                           blurRadius: 5,
                           offset: const Offset(0, 3),
                         ),
                       ],
                     ),
                     child: ListTile(
                       leading: Icon(Icons.shopping_bag_outlined,color: AppColor.primaryColor,),
                       title:   const Text('My Orders',style:TextStyle(fontWeight: FontWeight.bold) ,),
                       trailing:   Icon(Icons.arrow_forward_ios,color: AppColor.primaryColor,),
                       onTap: () {
                         context.push(AppRouter.kOrderListView);
                       },
                     )
    )
    ),
    ),
          Expanded(
            flex: 2,
            child : Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.notifications_none,color: AppColor.primaryColor,),
                      title:   const Text('Notifications' ,style:TextStyle(fontWeight: FontWeight.bold)),
                      trailing:   Icon(Icons.arrow_forward_ios,color: AppColor.primaryColor,),
                      onTap: () {
                        context.push(AppRouter.kNotificationsView);
                      },
                    )
                )
            ),
          ),
          Expanded(
            flex: 2,
            child : Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.person_2_outlined,color: AppColor.primaryColor,),
                      title:   const Text('update Profile',style:TextStyle(fontWeight: FontWeight.bold) ,),
                      trailing:   Icon(Icons.arrow_forward_ios,color: AppColor.primaryColor,),
                      onTap: () {

                         context.push(AppRouter.kUpdateProfileView);
                       },
                    )
                )
            ),
          ),
          Expanded(
            flex: 2,
            child : Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.output,color: AppColor.primaryColor,),
                      title:   const Text('Sign Out',style:TextStyle(fontWeight: FontWeight.bold) ,),
                      trailing:   Icon(Icons.arrow_forward_ios,color: AppColor.primaryColor,),
                      onTap: () {
                        TokenStorage().removeToken();
                        context.pushReplacement(AppRouter.kLoginView);
                      },
                    )
                )
            ),
          ),
          const Expanded(
              flex: 5,
              child: SizedBox(height: 30)),

        ],
      ),
    );
  }
}
