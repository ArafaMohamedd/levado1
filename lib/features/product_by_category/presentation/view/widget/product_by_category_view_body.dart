import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/product_by_category/data/models/product_bycategory_model.dart';
import 'package:levado/features/product_by_category/presentation/view_models/get_Product_by_category_cubit/get_Product_by_category_cubit.dart';
   import 'app_bar.dart';
 import 'listpopularWidget.dart';

class ProductByCategoryViewBody extends StatefulWidget {
    ProductByCategoryViewBody({Key? key,required this.category}) : super(key: key);
  String  category;
  @override
  ProductByCategoryViewBodyState createState() => ProductByCategoryViewBodyState();
}

class ProductByCategoryViewBodyState extends State<ProductByCategoryViewBody> {
  final ScrollController _scrollController = ScrollController();
  final List< ProductByCategoryModel> productList = [];
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

        await BlocProvider.of<GetProductByCategoryCubit>(context).getProductByCategory(
          widget.category,
          pageNum: nextPage++,
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
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarCategoryProduct(category: widget.category,),
           const SizedBox(height: 5),
             ListPopularProductBYCategoryWidget(productList: productList,),
          const SizedBox(height: 10),
        ],
      ),
    );
  }


}