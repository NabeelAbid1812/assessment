import 'dart:ui';

import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/image_constants.dart';
import 'package:assignment/constants/labels.dart';
import 'package:assignment/constants/textstyles.dart';
import 'package:assignment/controller/home_controller.dart';
import 'package:assignment/widgets/customButton.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
// import 'package:example/bottom_bar_creative.dart';

import '../widgets/story.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());
  List images =[Images.add,Images.searchWhite,Images.notification,Images.story1,Images.story2];

  List titles =[AppLabels().appListing,AppLabels().search,AppLabels().notification,AppLabels().electronics,AppLabels().appliances];

  PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    homeController.getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bottomBarColor,
      bottomNavigationBar: BottomBarCreative(
        items: [
          TabItem(
            icon: Icons.home_filled,
             title: AppLabels().home,
          ),
          TabItem(
            icon: Icons.search,
            title: AppLabels().discover,
          ),
          TabItem(
            icon: Icons.add

          //  title: AppLabels().home,
          ),
          TabItem(
            icon: Icons.add_business_outlined,
            title: AppLabels().deals,
          ),
          TabItem(
            icon: Icons.person_outline,
            title: AppLabels().profile,
          ),
        ],
        backgroundColor: AppColors.bottomBarColor,
        color: AppColors.whiteColor.withOpacity(0.7),
        colorSelected: AppColors.primaryColor,
        indexSelected: 0,
        iconSize: 29,


      ),


        body: Obx((){ return
          homeController.isLoading.value? 
          Center(child: CircularProgressIndicator(color: Colors.white,),):
          PageView(
            controller: controller,
            scrollDirection: Axis.vertical,
            children: [
              page(Images.bgImage),
              page(Images.bgImage2),
            ],
        
          );
        }
        ),
    );
  }

  SafeArea page(String image) {

    return SafeArea(
            child: Stack(
              children: [
                Image.asset(image,fit: BoxFit.fill,width: 100.w,),
                Container(
                  height: 15.h,
                  width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 2.h,0,2.h),
                    child: ListView.builder(
                        itemCount: images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return  Story(imageName : images[index],title: titles[index],index:index);
                        }),
                  ),
                ),
                Positioned(
                  bottom: 1.h,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: SizedBox(
                      width: 90.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width:75.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLabels().title,style: AppTextStyles.urbanist16,),
                                Text(AppLabels().price,style: AppTextStyles.urbanist24.copyWith(
                                    color: AppColors.textColor
                                ),),
                                SizedBox(height: 1.h,),
                                Text(AppLabels().description,style: AppTextStyles.urbanist12.copyWith(color: Color(0xffFFFFFF).withOpacity(0.7)),),
                                SizedBox(height: 0.75.h,),
                                Row(
                                  children: [
                                    Image.asset(Images.flag,width: 8.w,),
                                    SizedBox(width: 3.w,),
                                    Text(AppLabels().country,style: AppTextStyles.urbanist12,),
                                  ],
                                ),
                                SizedBox(height: 0.75.h,),
                                customButton(onPress: (){}, title: "Visit Website",textColor: Colors.white,width: 40,radius: 12,height: 5,),
                                // Container(
                                //   height: 5.5.h,
                                //   width: 40.w,
                                //   decoration: BoxDecoration(
                                //       gradient: LinearGradient(
                                //           colors: [
                                //             AppColors.secondaryColor,
                                //             AppColors.primaryColor,
                                //           ]),
                                //       borderRadius: BorderRadius.circular(8)
                                //   ),
                                //   child: ElevatedButton(onPressed: (){},
                                //     child: Text(AppLabels().buttonText,style: AppTextStyles.urbanist14,),
                                //     style: ElevatedButton.styleFrom(
                                //         backgroundColor: Colors.transparent,
                                //         shadowColor: Colors.transparent),


                                //   ),
                                // ),
                                SizedBox(height: 1.5.h,),
                                DotsIndicator(
                                  dotsCount: 5,
                                  position: 0,
                                  decorator: DotsDecorator(
                                      size: const Size.square(9.0),
                                      activeSize: const Size(18.0, 9.0),
                                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                      color: AppColors.whiteColor,
                                      activeColor: AppColors.textColor
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              customButtonRound(Images.offer,AppLabels().offer),
                              customButtonRound(Images.favorites,AppLabels().favorites),
                              customButtonRound(Images.comments,AppLabels().comments),
                              customButtonRound(Images.share,AppLabels().share),
                              CircleAvatar(
                                child: Image.asset(Images.myProfile),
                                radius: 24,
                              ),
                              SizedBox(height: 3.h,),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  Column customButtonRound(String image,String title) {
    return Column(
                        children: [
                          Image.asset(image,width: 13.w,),
                          SizedBox(height: 0.5.h,),
                          Text(title,style: AppTextStyles.urbanist14,),
                          SizedBox(height: 1.5.h,),
                        ],
                      );
  }
}

