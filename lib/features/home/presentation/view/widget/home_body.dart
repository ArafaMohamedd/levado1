import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/home/presentation/view/widget/popularTextWidget.dart';
import 'package:levado/features/home/presentation/view/widget/topCategoriesWidget.dart';
 import '../../view_models/get_Product_cubit/get_Product_cubit.dart';
import 'app_bar.dart';
import 'listpopularWidget.dart';
import 'middleCategoriesWidget.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  HomeBodyState createState() => HomeBodyState();
}
class HomeBodyState extends State<HomeBody> {
  final ScrollController _scrollController = ScrollController();

   bool _isLoading = false;
  int nextPage = 2;
  @override
  void initState() {
    super.initState();
     _scrollController.addListener(_scrollListener);
  }
  void _scrollListener()async {
     double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll >=  0.7* maxScroll) {
      if(!_isLoading){
        _isLoading=true;
        String brand=BlocProvider.of<GetProductCubit>(context).getBrand();
        String category=BlocProvider.of<GetProductCubit>(context).getCategory();
        String startPrice=BlocProvider.of<GetProductCubit>(context).getBeginPrice();
        String endPrice=BlocProvider.of<GetProductCubit>(context).getEndPrice();
         await BlocProvider.of<GetProductCubit>(context).getProduct(
          pageNum: nextPage++,
            brand: brand,
          category: category,
         beginPrice: startPrice,
          endPrice: endPrice,
        ) ;
        _isLoading=false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      controller: _scrollController,
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                const TopCategoriesWidget(),
                const SizedBox(height: 10),
                const MiddleCategoriesWidget(),
                const SizedBox(height: 5),
                const PopularTextWidget(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 7,right: 7),
                  child: const ListPopularWidget( ),
                ),

              ],
      ),
    );
  }
}
