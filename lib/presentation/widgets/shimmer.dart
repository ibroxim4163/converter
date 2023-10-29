import 'package:flutter/material.dart';

import '../../data/constants/app_colors.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Align(
              alignment: Alignment(.9, -.3),
              child: CircleAvatar(
                backgroundColor: AppColors.textFieldColor,
                radius: 22,
              ),
            ),
            Center(
              child: CustomBox(
                height: 35,
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 70,
                  right: 70,
                ),
              ),
            ),
            Center(
              child: CustomBox(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment(-.9, .2),
              child: CustomBox(
                height: 20,
                width: 70,
                padding: EdgeInsets.only(
                  left: 15,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBox(
                  height: 30,
                  width: 70,
                  padding: EdgeInsets.only(
                    left: 35,
                  ),
                ),
                CustomBox(
                  height: 45,
                  width: 120,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Divider(
              color: AppColors.textFieldColor,
              endIndent: 10,
              indent: 15,
              thickness: 1.5,
            ),
            Align(
              alignment: Alignment(-.9, .2),
              child: CustomBox(
                height: 20,
                width: 120,
                padding: EdgeInsets.only(
                  left: 15,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBox(
                  height: 30,
                  width: 70,
                  padding: EdgeInsets.only(
                    left: 35,
                  ),
                ),
                CustomBox(
                  height: 45,
                  width: 120,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomBox(
                height: 20,
                width: 100,
                padding: EdgeInsets.only(left: 20),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomBox(
                height: 20,
                width: 100,
                padding: EdgeInsets.only(left: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsets? padding;
  const CustomBox({
    this.height = 15,
    this.width = 60,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: AppColors.textFieldColor,
          ),
        ),
      ),
    );
  }
}
