import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/core/Utils/api_service.dart';
import 'package:levado/features/home/presentation/view_models/wishlist_cubit/wishlist_cubit.dart';
 import 'Core/Utils/app_router.dart';
 import 'core/Utils/app_theme.dart';
import 'features/Authentication/data/repos/loginRepos/login_repo_implemntaion.dart';
import 'features/Authentication/data/repos/signupRepos/signup_repo_implemntaion.dart';
import 'features/Authentication/presentation/view_models/login_cubit/login_cubit.dart';
import 'features/Authentication/presentation/view_models/signup_cubit/sign_up_cubit.dart';
import 'features/detail_product/data/repos/add_to_card_repos/add_to_card_repos_imp.dart';
import 'features/detail_product/presentation/view_models/add_to_card_cubit/add_to_card_cubit.dart';
import 'features/home/data/repos/brand_repos/brand_repo_implemntaion.dart';
import 'features/home/data/repos/category_type/categoryType_repo_implemntaion.dart';
import 'features/home/data/repos/productRepos/Product_repo_implemntaion.dart';
import 'features/home/data/repos/wishlist_Repos/wishlist_repo_imp.dart';
import 'features/home/presentation/view_models/get_Product_cubit/get_Product_cubit.dart';
import 'features/home/presentation/view_models/get_category_type_cubit/get_CategoryType_cubit.dart';
import 'features/home/presentation/view_models/get_prand_cubit/get_brand_cubit.dart';
void main() {
    runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(

            create: (context) =>
                LoginCubit(LoginRepoImp(ApiService(Dio())))),
        BlocProvider(
            create: (context) =>
                SignUpCubit(SignUpRepoImp(ApiService(Dio())))),
        BlocProvider(
          create: (context) => AddToCardCubit(AddToCardImp(ApiService(Dio()))) , ),
        BlocProvider(
            create: (context) =>
                GetProductCubit(GetProductRepoImp(ApiService(Dio())))..getProduct()),
        BlocProvider(
            create: (context) =>
            GetCategoryTypeCubit(GetCategoryTypeRepoImp(ApiService(Dio())))..getCategoryType()),
    BlocProvider(
    create: (context) => GetBrandCubit(GetBrandRepoImp(ApiService(Dio())))..getBrand(),
    ),
        BlocProvider(
          create: (context) => WishlistCubit(WishlistRepoImp(ApiService(Dio())))..wishlist(productId: ""),
        )

        
        
      ],
      child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appThemeData),
    );
  }
}