import 'package:go_router/go_router.dart';
import 'package:levado/features/Authentication/presentation/view/login_view.dart';
import 'package:levado/features/checkout/presentation/view/confirm_order_information.dart';
import 'package:levado/features/checkout/presentation/view/pay_syripe_view.dart';
import 'package:levado/features/home/data/models/product_model.dart';
import 'package:levado/features/home/presentation/view/all_product.dart';
import 'package:levado/features/my_orders/data/models/my_order_model.dart';
import 'package:levado/features/my_orders/presention/view/detalis_order_view.dart';
import 'package:levado/features/my_orders/presention/view/order_list.dart';
import 'package:levado/features/notifications/presentation/view/notifications_view.dart';
 import '../../features/Authentication/presentation/view/signup_view.dart';
import '../../features/Select_country/presentation/views/select_country_view.dart';
import '../../features/Splash/presentation/views/splash_view.dart';
import '../../features/checkout/presentation/view/coupon_view.dart';
import '../../features/checkout/presentation/view/create-order_view.dart';
import '../../features/detail_product/presentation/views/Add_erview_view.dart';
import '../../features/detail_product/presentation/views/detail_product_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/product_by_brand/presentation/view/product_by_brand_view.dart';
import '../../features/product_by_category/presentation/view/product_by_category_view.dart';
import '../../features/update_profile/presentation/view/update_Profile.dart';

abstract class AppRouter {

  static const kLoginView = '/LoginView';
  static const kSignupView = '/SignupView';
  static const kHomeView= '/HomeView';
  static const kDetailProductView= "/DetailProductView";
  static const  kProductByCategoryView= "/ProductByCategoryView";
  static const kProductByBrandView= "/ProductByBrandView";
  static const kCountrySelectionView ="/CountrySelectionView";
  static const kCreateOrderView = "/CreateOrderView";
  static const kCouponView= "/CouponView";
  static const kPayStripeView=  "/PayStripeView";
  static const kAllProductView="/AllProductView";
  static const kOrderListView="/OrderListView";
  static const  kOrderDetailsView="/OrderDetailsView";
  static const  kNotificationsView=  "/NotificationsView";
  static const  kUpdateProfileView= "/UpdateProfileView";
  static const  kAddReviewsView ="/AddReviewsView";
  static const  kConfirmOrderInformationView="/ConfirmOrderInformationView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const  LoginView(),
      ),

      GoRoute(
        path: kCountrySelectionView,
        builder: (context, state) =>    CountrySelectionView(),
      ),

      GoRoute(
        path: kUpdateProfileView,
        builder: (context, state) =>     const UpdateProfileView(),
      ),

      GoRoute(
        path:  kAddReviewsView,
        builder: (context, state) =>        AddReviewsView(productId:state.extra as String ,),
      ),
      GoRoute(
        path:  kAllProductView,
        builder: (context, state) =>     const AllProductView(),
      ),
      GoRoute(
        path:  kNotificationsView,
        builder: (context, state) =>     const  NotificationsView(),
      ),
      GoRoute(
        path:  kOrderListView,
        builder: (context, state) =>     const MyOrderListView(),
      ),

      GoRoute(
        path: kCreateOrderView,
        builder: (context, state) =>   const CreateOrderView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const  SignupView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const   HomeView(),
      ),

      GoRoute(
        path: kDetailProductView,
        builder: (context, state) =>    DetailProductView(data: state.extra as Map<String,String>, ),
      ),

      GoRoute(
        path: kOrderDetailsView,
        builder: (context, state) =>    OrderDetailsView(order:  state.extra as OrdersModel,),
      ),

      GoRoute(
        path: kProductByCategoryView ,
        builder: (context, state) =>    ProductByCategoryView(category:state.extra as String,),
      ),

      GoRoute(
        path: kProductByBrandView ,
        builder: (context, state) =>    ProductByBrandView(brand:state.extra as String,),
      ),

      GoRoute(
        path: kConfirmOrderInformationView ,
        builder: (context, state) =>      ConfirmOrderInformationView(
           oid:state.extra as String,
        ),
      ),

      GoRoute(
        path: kCouponView ,
        builder: (context, state) =>      CouponView (
          oid:state.extra as String,
        ),
      ),
      GoRoute(
        path:  kPayStripeView ,
        builder: (context, state) =>      PayStripeView  (
          oid:state.extra as String,
        ),
      ),
      ],
  );
}
