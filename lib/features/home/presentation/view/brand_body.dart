import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/core/widgets/error_widget.dart';
import 'package:levado/features/home/presentation/view/widget/loaging_widget.dart';
import '../view_models/get_prand_cubit/get_brand_cubit.dart';
class BrandBody extends StatelessWidget {
  const BrandBody({super.key, });

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<GetBrandCubit, GetBrandState>(
      builder: (context, state) {
        if (state is GetBrandSuccess) {
          final brands = state.allBrandType;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final width = MediaQuery.of(context).size.width;
              final height = MediaQuery.of(context).size.height;
              final brand = brands[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: GestureDetector(
                  onTap: () {
                    context.push(AppRouter.kProductByBrandView
                        ,extra: brands[index].title
                    );

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0,
                      child: GridTile(
                        footer: Container(
                          color: Colors.white.withOpacity(0.8),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            brand.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        child: CachedNetworkImage(
                          width: width / 1.7,
                          height: width / 1.7,
                          imageUrl: brand.image,
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is GetBrandFailure) {
           return const Center(child: CustomErrorWidget(errorMessage: 'Failed to load data. Please try again later.', key: null,));

        } else {
          return const Center(child: Center(child: LoadingWidget()));
        }
      },
    );
  }
}
