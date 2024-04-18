import 'package:flutter/material.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/Core/Utils/styles.dart';

import '../../../../../Core/widgets/custom_textformfield.dart';
import 'filter_drawer.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final tController = TextEditingController();
  String? search;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const FilterDrawer();
                },
              );
            },
            icon: const Icon(Icons.menu),
          ),

          Expanded(
              child: Center(
                child: Align(alignment: Alignment(-0.2, 0.6,),
                    child: Text("LEVADO",
                        style: Styles.textStyle25
                            .copyWith(color: AppColor.primaryColor,fontWeight: FontWeight.bold))),
              ),
          ),

          //  Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical:7, horizontal: 10),
          //     child: AppTextFormField(
          //       ctrl: tController,
          //       validator:    (data) {
          //         if (data!.isEmpty) {
          //           return 'Please enter some text';
          //         }
          //       },
          //       onFieldSubmitted: (value){
          //         search =value;
          //       },
          //       prefixIcon: const Icon(Icons.search),
          //
          //       hintText: "search..",
          //     ),
          //   ),
          // ),
        ],

      ),

    );
  }
}
