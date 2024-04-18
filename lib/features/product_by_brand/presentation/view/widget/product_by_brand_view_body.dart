import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
   import '../../../data/models/product_byBrand_model.dart';
 import '../../view_models/get_Product_by_prand_cubit/get_Product_by_prand_cubit.dart';
import 'app_bar.dart';
 import 'listpopularWidget.dart';

class ProductByBrandViewBody extends StatefulWidget {
    ProductByBrandViewBody({Key? key,required this.brand}) : super(key: key);
String brand;
  @override
  ProductByBrandViewBodyState createState() => ProductByBrandViewBodyState();
}

class ProductByBrandViewBodyState extends State<ProductByBrandViewBody> {
  final ScrollController _scrollController = ScrollController();

  final List< ProductByBrandModel> productList = [];
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

        await BlocProvider.of<GetProductByBrandCubit>(context).getProductByBrand(
         widget.brand,
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
    return   SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            CustomAppBarBrandProduct(brand: widget.brand ,),
           const SizedBox(height: 15),
             ListPopularBrandProductWidget(productList: productList, ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }


}