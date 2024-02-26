import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';

class Story extends StatelessWidget {

  String imageName;
  String title;
  int index;
  Story({
    super.key,
    required this.imageName,
    required this.title,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: GradientBoxBorder(
                      width: 2,
                      gradient: LinearGradient(colors: [
                        AppColors.secondaryColor,

                        AppColors.primaryColor,
                      ])
                  )),

              child: CircleAvatar(
                child: Padding(
                  padding:  EdgeInsets.all(index == 1 || index == 2 ? 12.0:0,),
                  child: Image.asset(imageName),
                ),
                backgroundColor: Colors.white.withOpacity(0.01),
                radius: 25,

              ),
            ),
            SizedBox(height: 0.75.h,),
            Text(title,style: AppTextStyles.urbanist12,),
          ],
    ),
          SizedBox(width: 2.w,)

        ],
      );
  }
}
