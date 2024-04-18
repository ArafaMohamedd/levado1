// import 'package:dio/dio.dart';
// import 'package:e_learning/Core/Utils/api_service.dart';
// import 'package:get_it/get_it.dart';
//
// import '../../Features/Authentication/data/repos/login_father_repo_implemntaion.dart';
// final getIt= GetIt.instance;
// void setup() {
//   getIt.registerSingleton<ApiService>(
//
//           ApiService(Dio()));
//   getIt.registerSingleton<LoginAdminRepoImp>(
//       LoginAdminRepoImp(
//         getIt.get<ApiService>()
//       )
//   );
//
//
//  }