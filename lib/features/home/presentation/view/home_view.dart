import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/Core/Utils/colors.dart';
  import '../view_models/get_Product_cubit/get_Product_cubit.dart';
import '../view_models/wishlist_cubit/wishlist_cubit.dart';
import 'Profile_view.dart';
import 'Wishlist_body.dart';
import 'brand_body.dart';
import 'cart_body.dart';
import 'widget/home_body.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 2;

  static final List<Widget> _widgetOptions = <Widget>[

    const BrandBody(),
    const CartBody(),
    const HomeBody(),
    const WishlistBody(),
    const ProfileBody()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index==2){
        BlocProvider.of<GetProductCubit>(context).setProductList([]);
        BlocProvider.of<GetProductCubit>(context).setEndPrice("");
        BlocProvider.of<GetProductCubit>(context).setBrand("");
        BlocProvider.of<GetProductCubit>(context).setBeginPrice("");
        BlocProvider.of<GetProductCubit>(context).setCategory("");
        BlocProvider.of<GetProductCubit>(context).getProduct(pageNum: 1) ;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.backColor,
            selectedItemColor:AppColor.primaryColor,
            unselectedItemColor: AppColor.textBodyGre,
            items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Brand',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
              ),

          ],
          currentIndex: _selectedIndex,
           onTap: _onItemTapped,
        ),
      ),
    );
  }
}
