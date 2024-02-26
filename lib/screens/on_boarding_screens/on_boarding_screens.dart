
import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/image_constants.dart';
import 'package:assignment/constants/labels.dart';
import 'package:assignment/constants/textstyles.dart';
import 'package:assignment/screens/Home.dart';
import 'package:assignment/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String des ="";

  List<Map<String, String?>> onboardingData = [
    {
      'image': Images.onBoard1,
      'title': "Discover Great Deals",
      'description': "Have something to sell? Just snap, upload, and price your items. We've made the process simple and quick. Get your items in front of buyers in no time!",
      'des': ""
    },
    {
      'image': Images.onBoard2,
      'title': "Effortless Selling",
      'description': "Have something to sell? Just snap, upload, and price your items. We've made the process simple and quick. Get your items in front of buyers in no time!",
      'des': ""

    },
    {
      'image': Images.onBoard3,
      'title': "Promote Your Business",
      'description': "Our platform is a powerful tool for businesses as well! Advertise your products or services to a large and engaged audience,",
      'des': ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff12305B) ,
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff12305B),
        elevation: 0,
    
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final imageData = onboardingData[index];
                return OnboardingPage(
                  image: imageData['image'] ?? '',
                  title: imageData['title'] ?? '',
                  description: imageData['description'] ?? '',
                  des:imageData['des'] ??'',
                );
              },
            ),
          ),
         // if (_currentPage < onboardingData.length - 1)
            Container(
              color: AppColors.bottomBarColor,
              child: buildIndicators()),
          Container(color: AppColors.bottomBarColor,
            child: Column(
              children: [
                SizedBox(height: 5.h,),// Display indicators on non-last pages
               
          
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                                 customButton2(
                                onPress: ()async {
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setBool("on_boarded", true);
                                  Get.offAll(()=>Home());
                                },
                                textColor: AppColors.blackColor,fontsize: 12,bgColor: Colors.white,height: 6,width: 42,
                                title:  "Skip"),
                                customButton(
                                onPress: ()async {
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setBool("on_boarded", true);
                                  if(_currentPage < onboardingData.length - 1){
                                    _currentPage+=1;
                                   _pageController.jumpToPage(_currentPage);
                                  }
                                  else{
                                     Get.offAll(()=>Home());

                                  }
                                
                                },
                                width: 42,textColor: Colors.white,
                                title: _currentPage < onboardingData.length - 1? "Next":"Explore"),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h,),
              ],
            ),
          ),


        ],
      ),
    );
  }

  Widget buildIndicators() {
    return Container(color: AppColors.bottomBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingData.length,
              (index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 3,
              backgroundColor:
              index == _currentPage ? AppColors.primaryColor : Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String des;

  const OnboardingPage(
      {super.key, required this.image, required this.title, required this.description, required this.des});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.h,),
          Image.asset(
            image,
            height: 30.h,
            width: 80.w,fit: BoxFit.cover,
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Container(
              color: AppColors.bottomBarColor,
              child: Column(
                children: [
                  SizedBox(height: 2.h,),
                  Text(
                    title,
                    style: AppTextStyles.urbanist14.copyWith(fontSize: 16.5.sp, color: AppColors.whiteColor, fontWeight: FontWeight.bold)
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.h),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.urbanist14.copyWith(fontSize: 10.5.sp,fontWeight: FontWeight.w400),
                    ),
                  ),
          
                 
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}