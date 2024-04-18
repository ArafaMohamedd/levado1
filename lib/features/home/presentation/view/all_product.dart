import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/home/presentation/view/widget/app_bar.dart';
import 'package:levado/features/home/presentation/view/widget/listpopularWidget.dart';
import '../../../../Core/Utils/colors.dart';
import '../../../../Core/Utils/styles.dart';
import '../view_models/get_Product_cubit/get_Product_cubit.dart';

 class AllProductView extends StatefulWidget{
  const AllProductView({super.key});

  @override
  State<AllProductView> createState() => _AllProductViewState();
}

class _AllProductViewState extends State<AllProductView> {
  @override
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;
  int nextPage = 2;
  late GetProductCubit _getProductCubit;

  @override
  void initState() {
     super.initState();
    _scrollController.addListener(_scrollListener);
     _getProductCubit = BlocProvider.of<GetProductCubit>(context);

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
    _getProductCubit.setProductList([]);
    _getProductCubit.setEndPrice("");
    _getProductCubit.setBrand("");
    _getProductCubit.setBeginPrice("");
    _getProductCubit.setCategory("");
    _getProductCubit.getProduct(pageNum: 1) ;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return    SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("All Product",
                    style: Styles.textStyle20.copyWith(
                        color: AppColor.primaryColor, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(height: 10),
              const ListPopularWidget( ),

            ],
          ),
        ),
      ),
    );
  }
}
