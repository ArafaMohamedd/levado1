import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:levado/Core/Utils/colors.dart';
import 'package:levado/Core/Utils/styles.dart';
import 'package:levado/core/Utils/app_router.dart';
import 'package:levado/core/Utils/app_shared_preferences.dart';

class CountrySelectionView extends StatelessWidget {
  final List<String> countries = [
    'Egypt',
    'UAE',
  ];
  final List<String> flag = [
    'assets/images/flag.png',
    'assets/images/united-arab-emirates.png',
  ];

  CountrySelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wight = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColor.primaryColor,
              size: wight * .4,
            ),
            Text(
              'Choose your city',
              style: Styles.textStyle25.copyWith(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Please choose your city so I can provide the best experience',
                style: Styles.textStyle20.copyWith(color: AppColor.textBodyGre),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return GestureDetector(
                    onTap: () async {
                      print('Country selected: $country');
                      context.pushReplacement(AppRouter.kHomeView);
                      await CityStorage().saveCityKey(country);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            flag[index],
                            height: wight * 0.2,
                            width: wight * 0.3,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            country,
                            style: Styles.textStyle25.copyWith(
                                color: AppColor.textBodyGre,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
