
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';

class customButton extends StatelessWidget {
  final String title;
  
  final double height ;
   final double width ;
  final Function() onPress;
  final double fontsize;
  Color? color;
  Color? textColor;
  double radius;
  Color borderColor;

   customButton({
    super.key,
    required this.onPress,required this.title,
this.height = 6.0,this.width=90,this.fontsize = 15.0,
     this.color = AppColors.blackColor,this.textColor = AppColors.primaryColor, this.radius = 30,this.borderColor=Colors.transparent
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onPress,
      child:
      Container(decoration: BoxDecoration(
        gradient: LinearGradient(
                                          colors: [
                                            AppColors.secondaryColor,
                                            AppColors.primaryColor,
                                          ]),
       borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor,width: 2)
      ),
      height: height.h,
      width: width.w,
     
       child: Center(
         child: Text(
           title,
           style: AppTextStyles.urbanist14.copyWith(color: textColor,fontSize: fontsize.sp),
         ),
       ),
          ),
    );
  }
}
class customButton2 extends StatelessWidget {
  final String title;
  final double height ;
   final double width ;
   Color bgColor;
   Color textColor;
  final double fontsize;

  final Function() onPress;

   customButton2({
    super.key,
    required this.onPress,required this.title,
this.height = 4,this.width=30,required this.fontsize,required this.textColor,required this.bgColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onPress,
      child:
      Container(decoration: BoxDecoration(
       color: bgColor,
       borderRadius: BorderRadius.circular(30)
      ),
      height: height.h,
      width: width.w,
     
       child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(
             title,
             style: AppTextStyles.urbanist14.copyWith(fontSize: fontsize.sp,fontWeight:FontWeight.w500,color: textColor ),
           ),
         ],
       ),
          ),
    );
  }
}