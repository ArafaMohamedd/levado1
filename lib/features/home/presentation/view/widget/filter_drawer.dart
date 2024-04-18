import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/Core/Utils/styles.dart';
import 'package:levado/Core/widgets/custom_button.dart';
import 'package:levado/core/Utils/colors.dart';
 import 'package:levado/features/home/presentation/view/widget/salary_widget.dart';
import 'package:levado/features/home/presentation/view_models/get_Product_cubit/get_Product_cubit.dart';
 import 'package:levado/features/home/presentation/view_models/get_category_type_cubit/get_CategoryType_cubit.dart';
import 'package:levado/features/home/presentation/view_models/get_prand_cubit/get_brand_cubit.dart';


class FilterDrawer extends StatefulWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  double _minPrice = 0;
  double _maxPrice = 10000;
   int selectedColorIndex = -1;
  String _selectedBrand = 'Any';
  String _selectedCatogry = 'Any';
  // List<Color> colors = [
  //   Colors.red,
  //   Colors.blue,
  //   Colors.green,
  //   Colors.yellow,
  //   Colors.orange,
  //   Colors.purple,
  //  ];


  @override
  Widget build(BuildContext context) {
    List<String> category =   BlocProvider.of<GetCategoryTypeCubit>(context).categoryName();
    List<String> brands =   BlocProvider.of<GetBrandCubit>(context).brandsName();
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const SizedBox(height:20 ,),

        TitleFilterWidget(title: 'price',),
        SalaryWidget(minPrice: _minPrice, maxPrice: _maxPrice),
        RangeSlider(
          values: RangeValues(_minPrice, _maxPrice),
          min: 0,
          max: 10000,
          divisions: 10000,
          onChanged: (RangeValues values) {
            setState(() {
              _minPrice = values.start;
              _maxPrice = values.end;
            });
          },
        ),
        // const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Divider(
        //     thickness: 1.5,
        //     color: Colors.grey,
        //   ),
        // ),
        // TitleFilterWidget(title: 'Color',),

        // SizedBox(
        //   width: double.infinity,
        //   child: Padding(
        //       padding: const EdgeInsets.all(6),
        //       child: GridView.builder(
        //         shrinkWrap:  true,
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 4,
        //         ),
        //         itemCount: colors.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return InkWell(
        //             onTap: () {
        //                setState(() {
        //                 selectedColorIndex = index;
        //               });
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.all(10),
        //               child: Container(
        //                 height: MediaQuery.of(context).size.height * 0.05,
        //                 width: MediaQuery.of(context).size.width * 0.1,
        //                 decoration: BoxDecoration(
        //                   shape: BoxShape.circle,
        //                   color: colors[index],
        //                   border: Border.all(
        //                     color: selectedColorIndex == index
        //                         ? Colors.black
        //                         : Colors
        //                             .transparent,
        //                     width: 2,
        //                   ),
        //                 ),
        //                 child: selectedColorIndex ==
        //                         index
        //                     ? const Center(
        //                         child: Icon(
        //                           Icons.check,
        //                           color: Colors.white,
        //                           size: 24,
        //                         ),
        //                       )
        //                     : null,
        //               ),
        //             ),
        //           );
        //         },
        //       )),
        // ),
        //



        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: 1.5,
            color: Colors.grey,
          ),
        ),
        TitleFilterWidget(title: 'Brand',),

           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: DropdownButton<String>(
           isExpanded: true,
              value: _selectedBrand,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBrand = newValue!;
                });
              },
              items: brands.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: 1.5,
            color: Colors.grey,
          ),
        ),

        TitleFilterWidget(title: 'Category',),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: DropdownButton<String>(
            isExpanded: true,
            value:  _selectedCatogry,
            onChanged: (String? newValue) {
              setState(() {
                _selectedCatogry = newValue!;
              });
            },
            items: category.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),


        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: 1.5,
            color: Colors.grey,
          ),
        ),
  Padding(
    padding: const EdgeInsets.all(30),
    child: CustomButton(onTap: (){
      BlocProvider.of<GetProductCubit>(context).setBrand(_selectedBrand);
      BlocProvider.of<GetProductCubit>(context).setCategory(_selectedCatogry);
      BlocProvider.of<GetProductCubit>(context).setBeginPrice(_minPrice.toString());
      BlocProvider.of<GetProductCubit>(context).setEndPrice( _maxPrice.toString());
      BlocProvider.of<GetProductCubit>(context).getProduct(pageNum: 1,
           brand:_selectedBrand == "Any" ? "" : _selectedBrand ,
           category:_selectedCatogry  == "Any" ? "" : _selectedCatogry,
           endPrice: _maxPrice==10000?"":_maxPrice.toString(),
           beginPrice: _minPrice==0?"":_minPrice.toString(),
      ) ;
      BlocProvider.of<GetProductCubit>(context).setProductList([]);
       Navigator.pop(context);
    },name: 'Apply Filters',),
  )

      ],
    );
  }
}

class TitleFilterWidget extends StatelessWidget {
  String title;
    TitleFilterWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title,style: Styles.textStyle20.copyWith(color: AppColor.textBodyColor,fontWeight: FontWeight.w700),),
    );
  }
}

